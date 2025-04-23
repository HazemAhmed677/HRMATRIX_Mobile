class OverTimeRequestModel {
	String? type;
	int? overTime;
	String? overTimeDate;
	String? overTimeStart;
	String? overTimeEnd;
	String? content;

	OverTimeRequestModel({
		this.type, 
		this.overTime, 
		this.overTimeDate, 
		this.overTimeStart, 
		this.overTimeEnd, 
		this.content, 
	});

	factory OverTimeRequestModel.fromJson(Map<String, dynamic> json) {
		return OverTimeRequestModel(
			type: json['type'] as String?,
			overTime: json['overTime'] as int?,
			overTimeDate: json['overTimeDate'] as String?,
			overTimeStart: json['overTimeStart'] as String?,
			overTimeEnd: json['overTimeEnd'] as String?,
			content: json['content'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'type': type,
				'overTime': overTime,
				'overTimeDate': overTimeDate,
				'overTimeStart': overTimeStart,
				'overTimeEnd': overTimeEnd,
				'content': content,
			};
}
