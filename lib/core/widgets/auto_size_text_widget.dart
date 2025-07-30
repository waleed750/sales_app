import '../core_export.dart';

class AutoSizeTextWidget extends StatelessWidget {
   const AutoSizeTextWidget({super.key, required this.title,this.style,this.maxLines=1});
  final String title;
  final TextStyle? style;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: style??AppTextStyles.font20BlackRegular,
      maxLines: maxLines,
    );
  }
}
