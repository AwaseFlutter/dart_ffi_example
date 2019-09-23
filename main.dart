import 'dart:ffi' as ffi;

typedef add_42_func = ffi.Int32 Function(ffi.Int32 num);
typedef Add42 = int Function(int num);

main() {
  // dylibファイルのロード
  final dylib = ffi.DynamicLibrary.open('testlib.dylib');

  // 関数を探す
  final add42 = dylib.lookup<ffi.NativeFunction<add_42_func>>('add_42');
  final add42Func = add42.asFunction<Add42>();

  // 実行
  final result_1 = add42Func(0);
  final result_2 = add42Func(1);

  print(result_1);
  print(result_2);
}
