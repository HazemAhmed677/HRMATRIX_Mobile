import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphview/GraphView.dart';

class HierarchicalTree extends StatefulWidget {
  const HierarchicalTree({super.key});

  @override
  State<HierarchicalTree> createState() => _HierarchicalTreeState();
}

class _HierarchicalTreeState extends State<HierarchicalTree> {
  final Graph graph = Graph();
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  Map<Node, bool> expandedStates = {};

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _buildOrganizationTree();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _buildOrganizationTree() {
    final ceo1 = Node.Id('CEO 1');
    final ceo2 = Node.Id('CEO 2');

    final heads1 = List.generate(4, (i) => Node.Id('H1-${i + 1}'));
    final heads2 = List.generate(4, (i) => Node.Id('H2-${i + 1}'));

    graph.addEdge(ceo1, ceo2);

    for (final head in heads1) {
      graph.addEdge(ceo1, head);
      _addManagers(head, 5);
    }

    for (final head in heads2) {
      graph.addEdge(ceo2, head);
      _addManagers(head, 5);
    }

    builder
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM
      ..siblingSeparation = 80
      ..levelSeparation = 100
      ..subtreeSeparation = 80;
  }

  void _addManagers(Node parent, int count) {
    final managers = List.generate(
      count,
      (i) => Node.Id('M${parent.key}-${i + 1}'),
    );
    for (final manager in managers) {
      graph.addEdge(parent, manager);
      _addMembers(manager, 4);
    }
  }

  void _addMembers(Node parent, int count) {
    final members = List.generate(
      count,
      (i) => Node.Id('E${parent.key}-${i + 1}'),
    );
    for (final member in members) {
      graph.addEdge(parent, member);
    }
  }

  void _toggleNode(Node node) {
    setState(() {
      expandedStates[node] = !(expandedStates[node] ?? true);
    });
  }

  Color _getNodeColor(Node node) {
    final level = node.key.toString().split('-').length - 1;
    const colors = [Colors.blueGrey, Colors.teal, Colors.indigo, Colors.grey];
    return colors[level % colors.length].withOpacity(0.9);
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      boundaryMargin: const EdgeInsets.all(100),
      minScale: 0.1,
      maxScale: 2.0,
      child: GraphView(
        graph: graph,
        algorithm: BuchheimWalkerAlgorithm(builder, null),
        paint:
            Paint()
              ..color = Colors.blueGrey.withOpacity(0.3)
              ..strokeWidth = 1.5,
        builder: (Node node) {
          final isExpanded = expandedStates[node] ?? true;
          return GestureDetector(
            onTap: () => _toggleNode(node),
            child: Container(
              width: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getNodeColor(node),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    node.key.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
