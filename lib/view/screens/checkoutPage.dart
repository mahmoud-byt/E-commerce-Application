import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/view/screens/confirmationPage.dart';
import 'package:store_app/view/widgets/customButton.dart';
import 'package:store_app/view/widgets/customFormField.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "CHECKOUT",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomFormField(
                  placeholder: "USERNAME",
                  icon: Icons.person,
                  keypoardType: TextInputType.name,
                  controller: controller),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                placeholder: "PHONE NUMBER",
                icon: Icons.phone,
                keypoardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black45),
                child: Text(
                  "TOTAL PRICE : ${context.read<ProductProvider>().totalMoney.toString()} EGP",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmationPage(
                            text: controller.text,
                          ),
                        ));
                  },
                  text: "CONFIRM",
                  borderRadius: 5,
                  margin: 8,
                  colors: const [
                    Color(0xffA9F1DF),
                    Color(0xffFFBBBB),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
