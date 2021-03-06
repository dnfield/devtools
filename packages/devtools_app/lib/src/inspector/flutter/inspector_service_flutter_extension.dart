import 'package:flutter/rendering.dart';
import 'package:vm_service/vm_service.dart';

import '../inspector_service.dart';

extension InspectorFlutterService on ObjectGroup {
  Future<InstanceRef> invokeTweakFlexProperties(
    InspectorInstanceRef ref,
    MainAxisAlignment mainAxisAlignment,
    CrossAxisAlignment crossAxisAlignment,
  ) async {
    final command = '((){'
        '  dynamic object = WidgetInspectorService.instance.toObject("${ref?.id}");'
        '  final render = object.renderObject;'
        '  render.mainAxisAlignment = $mainAxisAlignment;'
        '  render.crossAxisAlignment = $crossAxisAlignment;'
        '})()';
    final val = await inspectorLibrary.eval(
      command,
      isAlive: this,
    );
    return val;
  }
}
