class Branch {
  String? branchEngName;
  String? branchThName;
  String? branchValue;

  //Constructor
  Branch(this.branchEngName, this.branchThName, this.branchValue);

  static getBranch() {
    return [
      Branch('Computer Science', 'วิทยาการคอมพิวเตอร์', 'วิทยาการคอมพิวเตอร์'),
      Branch(
          'Information Technology', 'เทคโนโลยีสารสนเทศ', 'เทคโนโลยีสารสนเทศ'),
    ];
  }
}
