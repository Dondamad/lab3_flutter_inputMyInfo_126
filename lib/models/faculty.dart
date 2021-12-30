class Faculty {
  String? fucultyValue;
  String? facultyThName;

  //Constructor
  Faculty(this.fucultyValue, this.facultyThName);
  static getFaculty() {
    return [
      Faculty('1', 'คณะวิทยาศาสตร์'),
      Faculty('2', 'คณะวิทยาการสุขภาพและการกีฬา'),
      Faculty('3', 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      Faculty('4', 'คณะนิติศาสตร์'),
      Faculty('5', 'คณะวิศวกรรมศาสตร์'),
      Faculty('6', 'คณะพยาบาลศาสตร์'),
      Faculty('7', 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
      Faculty('8', 'คณะศึกษาศาสตร์'),
    ];
  }
}
