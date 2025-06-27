import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            const Spacer(),
            CustomImage(
              imageSrc: AppIcons.connection,
              imageColor: AppColors.primary,
            ),
            const SizedBox(width: 6),
            CustomText(
              text: "Language",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            _languageTile('Spanish'),
            const SizedBox(height: 12),
            _languageTile('English'),
            const Spacer(),
            CustomButton(
              width: 120,
              height: 45,
              borderRadius: 30,
              onTap: () {},
              title: "Save",
              fontSize: 16,
              textColor: Colors.white,
              fillColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageTile(String language) {
    final bool isSelected = selectedLanguage == language;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00C29E) : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
        child: RadioListTile<String>(
          value: language,
          groupValue: selectedLanguage,
          onChanged: (val) {
            setState(() {
              selectedLanguage = val!;
            });
          },
          contentPadding: EdgeInsets.zero,
          title: Text(
            language,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          activeColor: Colors.black,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }
}
