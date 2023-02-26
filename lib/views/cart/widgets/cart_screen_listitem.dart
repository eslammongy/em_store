import 'package:em_store/controllers/cart_controller.dart';
import 'package:em_store/views/widgets/small_body_text.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../data/models/cart_model.dart';
import '../../widgets/custom_image_box.dart';
import '../../widgets/head_text.dart';

class CartScreenListItem extends StatelessWidget {
  final CartModel cartModel;
  final CartController cartController;
  const CartScreenListItem(
      {super.key, required this.cartModel, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.cardRadius20),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 8,
              offset: Offset(1, 1),
              spreadRadius: 2),
        ],
      ),
      height: Dimensions.listViewTxtContainerSize,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.spaceHeight10 - 5,
        horizontal: Dimensions.spaceWidth10,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                width: Dimensions.spaceWidth20 * 5,
                height: Dimensions.spaceHeight20 * 5,
                child: CustomImageBox(
                    imageUrl:
                        "${AppConstant.BASE_URL}uploads/${cartModel.img!}")),
            SizedBox(
              width: Dimensions.spaceWidth10,
            ),
            Expanded(
                child: SizedBox(
              height: Dimensions.spaceHeight20 * 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeadLineText(
                      text: "${cartModel.name}",
                      textSize: 18,
                      textWeight: FontWeight.w600,
                    ),
                    SmallBodyText(text: "${cartModel.addingTime}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadLineText(
                          text: "\$${cartModel.price}",
                          textColor: Colors.orangeAccent,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.spaceHeight10,
                              horizontal: Dimensions.spaceWidth10),
                          decoration: BoxDecoration(
                              color: AppColors.buttonBGColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // controller.setQuantity(false);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.mainBlackColor,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.spaceWidth10 / 2,
                              ),
                              HeadLineText(text: "0".toString()),
                              SizedBox(
                                width: Dimensions.spaceWidth10 / 2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // controller.setQuantity(true);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.mainBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ))
          ]),
    );
  }
}
