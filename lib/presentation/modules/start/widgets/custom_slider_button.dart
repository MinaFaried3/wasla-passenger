import 'dart:async';

import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

class CustomSliderButton extends StatefulWidget {
  final double width;
  final double height;

  const CustomSliderButton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  CustomSliderButtonState createState() => CustomSliderButtonState();
}

class CustomSliderButtonState extends State<CustomSliderButton>
    with SingleTickerProviderStateMixin {
  double _value = 0.0;
  bool _isDragging = false;
  bool _isSlideCompleted = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateValue(double newValue) {
    setState(() {
      _value = newValue.clamp(0.0, 1.0);
      if (_value == 1) {
        setState(() {
          _isSlideCompleted = true;
        });

        _controller.forward();
      } else {
        setState(() {
          _isSlideCompleted = false;
        });
        _controller.reset();
      }
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isDragging = true;
    });

    _updateValue(details.localPosition.dx / widget.width);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _isDragging = true;
    });
    _updateValue(details.localPosition.dx / widget.width);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });
    if (!_isSlideCompleted) {
      _updateValue(0.0);
    }
    if (_isSlideCompleted) {
      Timer(const Duration(milliseconds: 500), () async {
        context.pushNamedAndRemoveUntil(Routes.home.path);
      });
      getIt<AppPreferences>().setData<bool>(
        key: PrefKeys.isDoneStartScreen,
        data: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s30),
          gradient: LinearGradient(colors: [
            ColorsManager.offWhite300.withOpacity(0.5),
            ColorsManager.offWhite300.withOpacity(0.25),
            ColorsManager.offWhite300.withOpacity(0.15),
            ColorsManager.offWhite300.withOpacity(0.0),
          ], stops: const [
            0.25,
            0.5,
            0.75,
            1
          ]),
        ),
        child: Stack(
          children: [
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   width: _value < 0.1
            //       ? _value * widget.width
            //       : (_value + 0.05) * widget.width,
            //   height: widget.height,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(AppSize.s30),
            //     color: _isSlideCompleted
            //         ? Colors.green
            //         : ColorsManager.tealPrimary,
            //   ),
            // ),
            if (!_isSlideCompleted)
              Positioned(
                top: widget.height * 0.1,
                left: _value * (widget.width - widget.height) +
                    widget.height * 0.1,
                child: Container(
                  width: widget.height * 0.8,
                  height: widget.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s24),
                    // shape: BoxShape.circle,
                    color: ColorsManager.offWhite,
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.start.tr(),
                      style: getExtraBoldStyle(
                        color: ColorsManager.tealPrimary1000,
                        fontSize: FontSize.s18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            Center(
              child: AnimatedOpacity(
                opacity: (_isDragging) ? 0 : 1,
                duration: DurationManager.m750,
                child: !_isSlideCompleted
                    ? Container(
                        width: widget.width - widget.height,
                        height: widget.height * 0.8,
                        padding: EdgeInsets.only(left: AppPadding.p40.w),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.height / 6),
                          color: Colors.transparent,
                        ),
                        child: const Row(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: ColorsManager.offWhite300,
                              textDirection: TextDirection.ltr,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: ColorsManager.offWhite400,
                              textDirection: TextDirection.ltr,
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
            if (_isSlideCompleted)
              FadeTransition(
                opacity: _animation,
                child: SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: Icon(
                    Icons.check,
                    color: ColorsManager.offWhite,
                    size: AppSize.s40.sp,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
