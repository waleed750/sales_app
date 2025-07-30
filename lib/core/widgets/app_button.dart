import '/core/core_export.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.hasBroder = false,
    required this.color,
    required this.text,
    required this.onTap,
    this.padding,
    this.height,
  });
  final bool hasBroder;
  final Color color;
  final String text;
  final Function() onTap;
  final EdgeInsetsGeometry? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        padding: padding ?? EdgeInsets.all(AppPadding.p15.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          color: hasBroder ? Colors.transparent : color,
          border: Border.all(color: color),
        ),
        child: Text(
          text,
          style: AppTextStyles.font22BlackRegular.copyWith(
            color: hasBroder ? color : AppColors.white,
          ),
        ),
      ),
    );
  }
}
