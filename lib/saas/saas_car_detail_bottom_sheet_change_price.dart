import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 底部：改价弹框
class ChangePriceBottomSheetWidget extends StatefulWidget {
  @override
  _ChangePriceBottomSheetWidgetState createState() =>
      _ChangePriceBottomSheetWidgetState();
}

class _ChangePriceBottomSheetWidgetState
    extends State<ChangePriceBottomSheetWidget> {
  ChangePriceBean _result;

  TextEditingController _controllerQuotedPrice;
  TextEditingController _controllerBasePrice;
  TextEditingController _controllerRemark;

  String _errorTextQuotedPrice;
  String _errorTextBasePrice;

  @override
  void initState() {
    super.initState();

    _result = ChangePriceBean();

    /// 报价 Controller
    _controllerQuotedPrice = TextEditingController();
    _controllerQuotedPrice.addListener(() {
      var err = _verifyQuotedPrice(_controllerQuotedPrice.text);
      if (err != _errorTextQuotedPrice) {
        //err不同才刷新控件，减少setState次数
        setState(() {
          _errorTextQuotedPrice = err;
        });
      }
    });

    /// 底价 Controller
    _controllerBasePrice = TextEditingController();
    _controllerBasePrice.addListener(() {
      var err = _verifyBasePrice(_controllerBasePrice.text);
      if (err != _errorTextBasePrice) {
        //err不同才刷新控件，减少setState次数
        setState(() {
          _errorTextBasePrice = err;
        });
      }
    });

    /// 备注 Controller
    _controllerRemark = TextEditingController();
  }

  // TODO 校验规则完善一下
  String _verifyQuotedPrice(String inputText) {
    if (inputText.length == 0) {
      return '不能为空';
    }
    return null;
  }

  // TODO 校验规则完善一下
  String _verifyBasePrice(String inputText) {
    if (inputText.length == 0) {
      return '不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: ListView(
        children: [
          Align(
            child: InkWell(
              child: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            alignment: Alignment.bottomRight,
          ),
          SizedBox(
            height: 10,
          ),

          /// 报价修改
          InputPriceWidget(
            title: '车主报价（万）',
            hint: '请输入车主报价',
            errorText: _errorTextQuotedPrice,
            controller: _controllerQuotedPrice,
          ),
          SizedBox(
            height: 10,
          ),

          ///底价修改
          InputPriceWidget(
            title: '车主底价（万）',
            hint: '请输入车主底价',
            errorText: _errorTextBasePrice,
            controller: _controllerBasePrice,
          ),
          SizedBox(
            height: 10,
          ),

          ///备注信息（非必填）
          TextField(
            controller: _controllerRemark,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
            maxLines: 3,
            decoration: InputDecoration(
              hintText: '备注',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () {
                if (_verifyQuotedPrice(_controllerQuotedPrice.text) == null &&
                    _verifyBasePrice(_controllerBasePrice.text) == null) {
                  _result.quotedPrice = _controllerQuotedPrice.text;
                  _result.basePrice = _controllerBasePrice.text;
                  _result.remark = _controllerRemark.text;
                  Navigator.of(context).pop(_result);
                }
              },
              child: Text(
                '确定',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputPriceWidget extends StatefulWidget {
  final String title; //标题
  final String hint; //hint提示
  final TextEditingController controller; //controller
  final String errorText;

  InputPriceWidget({
    @required this.title,
    @required this.hint,
    @required this.controller,
    this.errorText,
  });

  @override
  _InputPriceWidgetState createState() => _InputPriceWidgetState();
}

class _InputPriceWidgetState extends State<InputPriceWidget> {
  _InputPriceWidgetState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.title}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          inputFormatters: [
            _UsNumberTextInputFormatter(),
            LengthLimitingTextInputFormatter(10)
          ],
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            suffix: InkWell(
              child: Icon(
                Icons.close,
                color: Colors.grey,
                size: 15,
              ),
              onTap: () {
                widget.controller.text = '';
              },
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE9EAED), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

/// 只允许输入整数、小数 TextInputFormatter
class _UsNumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value != "" &&
        value != defaultDouble.toString() &&
        strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class ChangePriceBean {
  String basePrice;
  String quotedPrice;
  String remark;

  ChangePriceBean({this.basePrice, this.quotedPrice, this.remark});
}
