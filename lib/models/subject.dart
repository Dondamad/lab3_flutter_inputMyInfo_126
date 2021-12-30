class Subject {
  String? subjectValue;
  String? subjectThName;
  String? subjectEngName;
  bool? checked;

  //Constructor
  Subject(
      this.subjectThName, this.subjectEngName, this.subjectValue, this.checked);
  static getSubject() {
    return [
      Subject(
          'ระเบียบวิธีวิจัยทางวิทยาการคอมพิวเตอร์',
          'RESEARCH METHODS IN COMPUTER SCIENCE',
          'ระเบียบวิธีวิจัยทางวิทยาการคอมพิวเตอร์',
          false),
      Subject('วิศวกรรมซอฟต์แวร์', 'SOFTWARE ENGINEERING', 'วิศวกรรมซอฟต์แวร์',
          false),
      Subject(
          'การพัฒนาแอปพลิเคชันบนอุปกรณ์เคลื่อนที่',
          'MOBILE APPLICATION DEVELOPMENT',
          'การพัฒนาแอปพลิเคชันบนอุปกรณ์เคลื่อนที่',
          false),
      Subject(
          'ความปลอดภัยบนเครือข่ายคอมพิวเตอร์',
          'SECURITY IN COMPUTER NETWORKS',
          'ความปลอดภัยบนเครือข่ายคอมพิวเตอร์',
          false),
      Subject(
          'ปัญญาประดิษฐ์', 'ARTIFICIAL INTELLIGENCE', 'ปัญญาประดิษฐ์', false),
      Subject('สัมมนาทางวิทยาการคอมพิวเตอร์', 'SEMINAR IN COMPUTER SCIENCE',
          'สัมมนาทางวิทยาการคอมพิวเตอร์', false),
      Subject(
          'เทคโนโลยีและภูมิปัญญาท้องถิ่นด้านอาหาร',
          'TECHNOLOGY AND LOCAL WISDOM OF FOOD',
          'เทคโนโลยีและภูมิปัญญาท้องถิ่นด้านอาหาร',
          false),
    ];
  }
}
