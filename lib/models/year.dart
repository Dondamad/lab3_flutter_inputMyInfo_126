class YearStudy {
  String? yearStudy;
  String? yearValue;

  //Constructor
  YearStudy(this.yearStudy, this.yearValue);

  static getYear() {
    return [
      YearStudy('ปีที่ 1', '1'),
      YearStudy('ปีที่ 2', '2'),
      YearStudy('ปีที่ 3', '3'),
      YearStudy('ปีที่ 4', '4'),
    ];
  }
}
