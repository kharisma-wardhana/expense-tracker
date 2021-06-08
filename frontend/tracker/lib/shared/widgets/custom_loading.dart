part of 'widgets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LottieBuilder.asset(
          'assets/animations/loading.json',
        ),
      ),
    );
  }
}
