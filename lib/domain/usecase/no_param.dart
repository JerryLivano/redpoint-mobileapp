class NoParam {
  static final NoParam _instance = NoParam._internal();

  NoParam._internal();

  factory NoParam() {
    return _instance;
  }
}
