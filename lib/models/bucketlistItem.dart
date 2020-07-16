class BucketListItem {
  String itemName;
  bool completed;

  BucketListItem(String name) {
    itemName = name;
    completed = false;
  }

  itemCompleted() {
    completed = true;
  }

  markCompleted() {
    return completed;
  }
}
