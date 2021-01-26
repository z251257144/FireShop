import 'package:flutter/material.dart';

typedef CartNumberCallBack = void Function(int);

class CartNumberButton extends StatefulWidget {
  final double width;
  final double height;

  final int defaultValue;
  final int minValue;
  final int maxValue;

  final CartNumberCallBack callBack;

  const CartNumberButton({
    Key key,
    this.width = 100,
    this.height = 32,
    this.defaultValue = 1,
    this.minValue = 1,
    this.maxValue = 99,
    this.callBack
  }) : super(key: key);

  @override
  _CartNumberButtonState createState() => _CartNumberButtonState(
    width,
    height,
    defaultValue,
    minValue,
    maxValue,
    callBack
  );
}

class _CartNumberButtonState extends State<CartNumberButton> {

  final double width;
  final double height;
  int defaultValue;
  final int minValue;
  final int maxValue;

  final CartNumberCallBack callBack;

  _CartNumberButtonState(
      this.width,
      this.height,
      this.defaultValue,
      this.minValue,
      this.maxValue,
      this.callBack
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        children: <Widget>[
          leftButton(),
          middleView(),
          rightButton()
        ],
      ),
    );
  }

  leftButton() {
    bool canTap = minValue < defaultValue;
    return InkWell(
      onTap: !canTap ? null : () {
        leftButtonPressed();
      },
      child: Container(
        alignment: Alignment.center,
        width: this.height,
        decoration: BoxDecoration(
          color: canTap ? null : Color(0xffF5F4F9),
          border: Border.all(
            color: Colors.black26,
            width: 0.5
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4)
          )
        ),
        child: Text("-",
          style: TextStyle(
            fontSize: 15,
            color: canTap ? Colors.black : Colors.black38,
          ),
        ),
      ),
    );
  }

  middleView() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: this.height,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 0.5
            ),
            bottom: BorderSide(
                color: Colors.black26,
                width: 0.5
            )
          )
        ),
        child: Text(defaultValue.toString()

        ),
      )
    );
  }

  rightButton() {
    bool canTap = maxValue > defaultValue;
    return InkWell(
      onTap: !canTap ? null : () {
        rightButtonPressed();
      },
      child: Container(
        alignment: Alignment.center,
        width: this.height,
        decoration: BoxDecoration(
          color: canTap ? null : Color(0xffF5F4F9),
          border: Border.all(
              color: Colors.black26,
              width: 0.5
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4)
          )
        ),
        child: Text("+",
          style: TextStyle(
            fontSize: 15,
            color: canTap ? Colors.black : Colors.black38,
          ),
        ),
      ),
    );
  }

  // 减少数量
  leftButtonPressed() {
    setState(() {
      defaultValue --;
      callBack(defaultValue);
    });

  }

  // 增加数量
  rightButtonPressed() {
    setState(() {
      defaultValue ++;
      callBack(defaultValue);
    });
  }
}
