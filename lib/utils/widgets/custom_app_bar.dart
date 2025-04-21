import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';
import 'package:tn_jewellery_admin/utils/dimensions.dart' show Dimensions;
import 'package:tn_jewellery_admin/utils/styles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function()? onBackPressed;
  final bool? showCart;
  final bool? isLogin;
  final bool? centerTitle;
  final Color? bgColor;
  final Color? titleColor;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.isLogin = false,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.showCart = false,
      this.centerTitle = false,
      this.bgColor,
      this.titleColor,
      this.actions = const [SizedBox()]});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: ubuntuBold.copyWith(
            fontSize: Dimensions.fontSizeExtraLarge,
            color: titleColor ?? Theme.of(context).primaryColor),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: true,
      titleSpacing: isBackButtonExist ? 5 : 10,
      leading: isBackButtonExist
          ? IconButton(
              splashRadius: Dimensions.paddingSizeLarge,
              hoverColor: Colors.transparent,
              icon: Icon(Icons.arrow_back,
                  color: titleColor ?? Theme.of(context).primaryColor),
              color: Theme.of(context).textTheme.bodyLarge!.color,
              onPressed: () => (isLogin != null && isLogin!)
                  ? Get.offAllNamed(RouteHelper.onBoardScreen)
                  : onBackPressed != null
                      ? onBackPressed!()
                      : Navigator.pop(context),
            )
          : null,
      backgroundColor: bgColor,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.preferredSize);
}
