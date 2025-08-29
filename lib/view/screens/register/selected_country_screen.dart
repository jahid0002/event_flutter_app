import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/screens/register/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class PhoneCallLoginOnboard extends StatelessWidget {
  PhoneCallLoginOnboard({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  CustomText(
                    text: "Back",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    left: 8,
                  ),
                ],
              ),
              CustomText(
                top: 40,
                text: "Where do you call home? 🏡",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
                maxLines: 2,
              ),
              CustomText(
                top: 10,
                text:
                    "Sharing your hometown helps others connect with your story.",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 170,
              ),
              CountryPickerField(
                fillColor: Color(0xffF9FAFB),
                hintText: "Where are your from?",
                countries: countriesWithFlags, // pass your country list here
              ),

              // CustomTextField(
              //   fillColor: Color(0xffF9FAFB),
              //   hintText: "Where are your from?",
              // ),
              //   Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: "Next",
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              right: 8,
            ),
            GestureDetector(
              onTap: () {
                if (controller.countryController.value.text.isEmpty) {
                  showCustomSnackBar("Please select your country");
                  return;
                }
                debugPrint(
                  "Country: ${controller.countryController.value.text}",
                );
                Get.toNamed(AppRoutes.talkToMeLoginOnboarding);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                maxRadius: 20,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<Map<String, String>> countriesWithFlags = [
    {
      "code": "AF",
      "name": "Afghanistan",
      "flag": "https://flagcdn.com/w40/af.png",
    },
    {"code": "AL", "name": "Albania", "flag": "https://flagcdn.com/w40/al.png"},
    {"code": "DZ", "name": "Algeria", "flag": "https://flagcdn.com/w40/dz.png"},
    {
      "code": "AS",
      "name": "American Samoa",
      "flag": "https://flagcdn.com/w40/as.png",
    },
    {"code": "AD", "name": "Andorra", "flag": "https://flagcdn.com/w40/ad.png"},
    {"code": "AO", "name": "Angola", "flag": "https://flagcdn.com/w40/ao.png"},
    {
      "code": "AI",
      "name": "Anguilla",
      "flag": "https://flagcdn.com/w40/ai.png",
    },
    {
      "code": "AQ",
      "name": "Antarctica",
      "flag": "https://flagcdn.com/w40/aq.png",
    },
    {
      "code": "AG",
      "name": "Antigua and Barbuda",
      "flag": "https://flagcdn.com/w40/ag.png",
    },
    {
      "code": "AR",
      "name": "Argentina",
      "flag": "https://flagcdn.com/w40/ar.png",
    },
    {"code": "AM", "name": "Armenia", "flag": "https://flagcdn.com/w40/am.png"},
    {"code": "AW", "name": "Aruba", "flag": "https://flagcdn.com/w40/aw.png"},
    {
      "code": "AU",
      "name": "Australia",
      "flag": "https://flagcdn.com/w40/au.png",
    },
    {"code": "AT", "name": "Austria", "flag": "https://flagcdn.com/w40/at.png"},
    {
      "code": "AZ",
      "name": "Azerbaijan",
      "flag": "https://flagcdn.com/w40/az.png",
    },
    {"code": "BS", "name": "Bahamas", "flag": "https://flagcdn.com/w40/bs.png"},
    {"code": "BH", "name": "Bahrain", "flag": "https://flagcdn.com/w40/bh.png"},
    {
      "code": "BD",
      "name": "Bangladesh",
      "flag": "https://flagcdn.com/w40/bd.png",
    },
    {
      "code": "BB",
      "name": "Barbados",
      "flag": "https://flagcdn.com/w40/bb.png",
    },
    {"code": "BY", "name": "Belarus", "flag": "https://flagcdn.com/w40/by.png"},
    {"code": "BE", "name": "Belgium", "flag": "https://flagcdn.com/w40/be.png"},
    {"code": "BZ", "name": "Belize", "flag": "https://flagcdn.com/w40/bz.png"},
    {"code": "BJ", "name": "Benin", "flag": "https://flagcdn.com/w40/bj.png"},
    {"code": "BM", "name": "Bermuda", "flag": "https://flagcdn.com/w40/bm.png"},
    {"code": "BT", "name": "Bhutan", "flag": "https://flagcdn.com/w40/bt.png"},
    {"code": "BO", "name": "Bolivia", "flag": "https://flagcdn.com/w40/bo.png"},
    {
      "code": "BA",
      "name": "Bosnia and Herzegovina",
      "flag": "https://flagcdn.com/w40/ba.png",
    },
    {
      "code": "BW",
      "name": "Botswana",
      "flag": "https://flagcdn.com/w40/bw.png",
    },
    {"code": "BR", "name": "Brazil", "flag": "https://flagcdn.com/w40/br.png"},
    {
      "code": "IO",
      "name": "British Indian Ocean Territory",
      "flag": "https://flagcdn.com/w40/io.png",
    },
    {
      "code": "VG",
      "name": "British Virgin Islands",
      "flag": "https://flagcdn.com/w40/vg.png",
    },
    {"code": "BN", "name": "Brunei", "flag": "https://flagcdn.com/w40/bn.png"},
    {
      "code": "BG",
      "name": "Bulgaria",
      "flag": "https://flagcdn.com/w40/bg.png",
    },
    {
      "code": "BF",
      "name": "Burkina Faso",
      "flag": "https://flagcdn.com/w40/bf.png",
    },
    {"code": "BI", "name": "Burundi", "flag": "https://flagcdn.com/w40/bi.png"},
    {
      "code": "KH",
      "name": "Cambodia",
      "flag": "https://flagcdn.com/w40/kh.png",
    },
    {
      "code": "CM",
      "name": "Cameroon",
      "flag": "https://flagcdn.com/w40/cm.png",
    },
    {"code": "CA", "name": "Canada", "flag": "https://flagcdn.com/w40/ca.png"},
    {
      "code": "CV",
      "name": "Cape Verde",
      "flag": "https://flagcdn.com/w40/cv.png",
    },
    {
      "code": "KY",
      "name": "Cayman Islands",
      "flag": "https://flagcdn.com/w40/ky.png",
    },
    {
      "code": "CF",
      "name": "Central African Republic",
      "flag": "https://flagcdn.com/w40/cf.png",
    },
    {"code": "TD", "name": "Chad", "flag": "https://flagcdn.com/w40/td.png"},
    {"code": "CL", "name": "Chile", "flag": "https://flagcdn.com/w40/cl.png"},
    {"code": "CN", "name": "China", "flag": "https://flagcdn.com/w40/cn.png"},
    {
      "code": "CX",
      "name": "Christmas Island",
      "flag": "https://flagcdn.com/w40/cx.png",
    },
    {
      "code": "CC",
      "name": "Cocos Islands",
      "flag": "https://flagcdn.com/w40/cc.png",
    },
    {
      "code": "CO",
      "name": "Colombia",
      "flag": "https://flagcdn.com/w40/co.png",
    },
    {"code": "KM", "name": "Comoros", "flag": "https://flagcdn.com/w40/km.png"},
    {
      "code": "CK",
      "name": "Cook Islands",
      "flag": "https://flagcdn.com/w40/ck.png",
    },
    {
      "code": "CR",
      "name": "Costa Rica",
      "flag": "https://flagcdn.com/w40/cr.png",
    },
    {"code": "HR", "name": "Croatia", "flag": "https://flagcdn.com/w40/hr.png"},
    {"code": "CU", "name": "Cuba", "flag": "https://flagcdn.com/w40/cu.png"},
    {"code": "CW", "name": "Curacao", "flag": "https://flagcdn.com/w40/cw.png"},
    {"code": "CY", "name": "Cyprus", "flag": "https://flagcdn.com/w40/cy.png"},
    {
      "code": "CZ",
      "name": "Czech Republic",
      "flag": "https://flagcdn.com/w40/cz.png",
    },
    {
      "code": "CD",
      "name": "Democratic Republic of the Congo",
      "flag": "https://flagcdn.com/w40/cd.png",
    },
    {"code": "DK", "name": "Denmark", "flag": "https://flagcdn.com/w40/dk.png"},
    {
      "code": "DJ",
      "name": "Djibouti",
      "flag": "https://flagcdn.com/w40/dj.png",
    },
    {
      "code": "DM",
      "name": "Dominica",
      "flag": "https://flagcdn.com/w40/dm.png",
    },
    {
      "code": "DO",
      "name": "Dominican Republic",
      "flag": "https://flagcdn.com/w40/do.png",
    },
    {"code": "EC", "name": "Ecuador", "flag": "https://flagcdn.com/w40/ec.png"},
    {"code": "EG", "name": "Egypt", "flag": "https://flagcdn.com/w40/eg.png"},
    {
      "code": "SV",
      "name": "El Salvador",
      "flag": "https://flagcdn.com/w40/sv.png",
    },
    {
      "code": "GQ",
      "name": "Equatorial Guinea",
      "flag": "https://flagcdn.com/w40/gq.png",
    },
    {"code": "ER", "name": "Eritrea", "flag": "https://flagcdn.com/w40/er.png"},
    {"code": "EE", "name": "Estonia", "flag": "https://flagcdn.com/w40/ee.png"},
    {
      "code": "SZ",
      "name": "Eswatini",
      "flag": "https://flagcdn.com/w40/sz.png",
    },
    {
      "code": "ET",
      "name": "Ethiopia",
      "flag": "https://flagcdn.com/w40/et.png",
    },
    {
      "code": "FK",
      "name": "Falkland Islands",
      "flag": "https://flagcdn.com/w40/fk.png",
    },
    {
      "code": "FO",
      "name": "Faroe Islands",
      "flag": "https://flagcdn.com/w40/fo.png",
    },
    {"code": "FJ", "name": "Fiji", "flag": "https://flagcdn.com/w40/fj.png"},
    {"code": "FI", "name": "Finland", "flag": "https://flagcdn.com/w40/fi.png"},
    {"code": "FR", "name": "France", "flag": "https://flagcdn.com/w40/fr.png"},
    {
      "code": "PF",
      "name": "French Polynesia",
      "flag": "https://flagcdn.com/w40/pf.png",
    },
    {"code": "GA", "name": "Gabon", "flag": "https://flagcdn.com/w40/ga.png"},
    {"code": "GM", "name": "Gambia", "flag": "https://flagcdn.com/w40/gm.png"},
    {"code": "GE", "name": "Georgia", "flag": "https://flagcdn.com/w40/ge.png"},
    {"code": "DE", "name": "Germany", "flag": "https://flagcdn.com/w40/de.png"},
    {"code": "GH", "name": "Ghana", "flag": "https://flagcdn.com/w40/gh.png"},
    {
      "code": "GI",
      "name": "Gibraltar",
      "flag": "https://flagcdn.com/w40/gi.png",
    },
    {"code": "GR", "name": "Greece", "flag": "https://flagcdn.com/w40/gr.png"},
    {
      "code": "GL",
      "name": "Greenland",
      "flag": "https://flagcdn.com/w40/gl.png",
    },
    {"code": "GD", "name": "Grenada", "flag": "https://flagcdn.com/w40/gd.png"},
    {"code": "GU", "name": "Guam", "flag": "https://flagcdn.com/w40/gu.png"},
    {
      "code": "GT",
      "name": "Guatemala",
      "flag": "https://flagcdn.com/w40/gt.png",
    },
    {
      "code": "GG",
      "name": "Guernsey",
      "flag": "https://flagcdn.com/w40/gg.png",
    },
    {"code": "GN", "name": "Guinea", "flag": "https://flagcdn.com/w40/gn.png"},
    {
      "code": "GW",
      "name": "Guinea-Bissau",
      "flag": "https://flagcdn.com/w40/gw.png",
    },
    {"code": "GY", "name": "Guyana", "flag": "https://flagcdn.com/w40/gy.png"},
    {"code": "HT", "name": "Haiti", "flag": "https://flagcdn.com/w40/ht.png"},
    {
      "code": "HN",
      "name": "Honduras",
      "flag": "https://flagcdn.com/w40/hn.png",
    },
    {
      "code": "HK",
      "name": "Hong Kong",
      "flag": "https://flagcdn.com/w40/hk.png",
    },
    {"code": "HU", "name": "Hungary", "flag": "https://flagcdn.com/w40/hu.png"},
    {"code": "IS", "name": "Iceland", "flag": "https://flagcdn.com/w40/is.png"},
    {"code": "IN", "name": "India", "flag": "https://flagcdn.com/w40/in.png"},
    {
      "code": "ID",
      "name": "Indonesia",
      "flag": "https://flagcdn.com/w40/id.png",
    },
    {"code": "IR", "name": "Iran", "flag": "https://flagcdn.com/w40/ir.png"},
    {"code": "IQ", "name": "Iraq", "flag": "https://flagcdn.com/w40/iq.png"},
    {"code": "IE", "name": "Ireland", "flag": "https://flagcdn.com/w40/ie.png"},
    {
      "code": "IM",
      "name": "Isle of Man",
      "flag": "https://flagcdn.com/w40/im.png",
    },
    {"code": "IL", "name": "Israel", "flag": "https://flagcdn.com/w40/il.png"},
    {"code": "IT", "name": "Italy", "flag": "https://flagcdn.com/w40/it.png"},
    {
      "code": "CI",
      "name": "Ivory Coast",
      "flag": "https://flagcdn.com/w40/ci.png",
    },
    {"code": "JM", "name": "Jamaica", "flag": "https://flagcdn.com/w40/jm.png"},
    {"code": "JP", "name": "Japan", "flag": "https://flagcdn.com/w40/jp.png"},
    {"code": "JE", "name": "Jersey", "flag": "https://flagcdn.com/w40/je.png"},
    {"code": "JO", "name": "Jordan", "flag": "https://flagcdn.com/w40/jo.png"},
    {
      "code": "KZ",
      "name": "Kazakhstan",
      "flag": "https://flagcdn.com/w40/kz.png",
    },
    {"code": "KE", "name": "Kenya", "flag": "https://flagcdn.com/w40/ke.png"},
    {
      "code": "KI",
      "name": "Kiribati",
      "flag": "https://flagcdn.com/w40/ki.png",
    },
    {"code": "KW", "name": "Kuwait", "flag": "https://flagcdn.com/w40/kw.png"},
    {
      "code": "KG",
      "name": "Kyrgyzstan",
      "flag": "https://flagcdn.com/w40/kg.png",
    },
    {"code": "LA", "name": "Laos", "flag": "https://flagcdn.com/w40/la.png"},
    {"code": "LV", "name": "Latvia", "flag": "https://flagcdn.com/w40/lv.png"},
    {"code": "LB", "name": "Lebanon", "flag": "https://flagcdn.com/w40/lb.png"},
    {"code": "LS", "name": "Lesotho", "flag": "https://flagcdn.com/w40/ls.png"},
    {"code": "LR", "name": "Liberia", "flag": "https://flagcdn.com/w40/lr.png"},
    {"code": "LY", "name": "Libya", "flag": "https://flagcdn.com/w40/ly.png"},
    {
      "code": "LI",
      "name": "Liechtenstein",
      "flag": "https://flagcdn.com/w40/li.png",
    },
    {
      "code": "LT",
      "name": "Lithuania",
      "flag": "https://flagcdn.com/w40/lt.png",
    },
    {
      "code": "LU",
      "name": "Luxembourg",
      "flag": "https://flagcdn.com/w40/lu.png",
    },
    {"code": "MO", "name": "Macau", "flag": "https://flagcdn.com/w40/mo.png"},
    {
      "code": "MG",
      "name": "Madagascar",
      "flag": "https://flagcdn.com/w40/mg.png",
    },
    {"code": "MW", "name": "Malawi", "flag": "https://flagcdn.com/w40/mw.png"},
    {
      "code": "MY",
      "name": "Malaysia",
      "flag": "https://flagcdn.com/w40/my.png",
    },
    {
      "code": "MV",
      "name": "Maldives",
      "flag": "https://flagcdn.com/w40/mv.png",
    },
    {"code": "ML", "name": "Mali", "flag": "https://flagcdn.com/w40/ml.png"},
    {"code": "MT", "name": "Malta", "flag": "https://flagcdn.com/w40/mt.png"},
    {
      "code": "MH",
      "name": "Marshall Islands",
      "flag": "https://flagcdn.com/w40/mh.png",
    },
    {
      "code": "MQ",
      "name": "Martinique",
      "flag": "https://flagcdn.com/w40/mq.png",
    },
    {
      "code": "MR",
      "name": "Mauritania",
      "flag": "https://flagcdn.com/w40/mr.png",
    },
    {
      "code": "MU",
      "name": "Mauritius",
      "flag": "https://flagcdn.com/w40/mu.png",
    },
    {"code": "YT", "name": "Mayotte", "flag": "https://flagcdn.com/w40/yt.png"},
    {"code": "MX", "name": "Mexico", "flag": "https://flagcdn.com/w40/mx.png"},
    {
      "code": "FM",
      "name": "Micronesia",
      "flag": "https://flagcdn.com/w40/fm.png",
    },
    {"code": "MD", "name": "Moldova", "flag": "https://flagcdn.com/w40/md.png"},
    {"code": "MC", "name": "Monaco", "flag": "https://flagcdn.com/w40/mc.png"},
    {
      "code": "MN",
      "name": "Mongolia",
      "flag": "https://flagcdn.com/w40/mn.png",
    },
    {
      "code": "ME",
      "name": "Montenegro",
      "flag": "https://flagcdn.com/w40/me.png",
    },
    {
      "code": "MS",
      "name": "Montserrat",
      "flag": "https://flagcdn.com/w40/ms.png",
    },
    {"code": "MA", "name": "Morocco", "flag": "https://flagcdn.com/w40/ma.png"},
    {
      "code": "MZ",
      "name": "Mozambique",
      "flag": "https://flagcdn.com/w40/mz.png",
    },
    {"code": "MM", "name": "Myanmar", "flag": "https://flagcdn.com/w40/mm.png"},
    {"code": "NA", "name": "Namibia", "flag": "https://flagcdn.com/w40/na.png"},
    {"code": "NR", "name": "Nauru", "flag": "https://flagcdn.com/w40/nr.png"},
    {"code": "NP", "name": "Nepal", "flag": "https://flagcdn.com/w40/np.png"},
    {
      "code": "NL",
      "name": "Netherlands",
      "flag": "https://flagcdn.com/w40/nl.png",
    },
    {
      "code": "NC",
      "name": "New Caledonia",
      "flag": "https://flagcdn.com/w40/nc.png",
    },
    {
      "code": "NZ",
      "name": "New Zealand",
      "flag": "https://flagcdn.com/w40/nz.png",
    },
    {
      "code": "NI",
      "name": "Nicaragua",
      "flag": "https://flagcdn.com/w40/ni.png",
    },
    {"code": "NE", "name": "Niger", "flag": "https://flagcdn.com/w40/ne.png"},
    {"code": "NG", "name": "Nigeria", "flag": "https://flagcdn.com/w40/ng.png"},
    {"code": "NU", "name": "Niue", "flag": "https://flagcdn.com/w40/nu.png"},
    {
      "code": "KP",
      "name": "North Korea",
      "flag": "https://flagcdn.com/w40/kp.png",
    },
    {
      "code": "MK",
      "name": "North Macedonia",
      "flag": "https://flagcdn.com/w40/mk.png",
    },
    {"code": "NO", "name": "Norway", "flag": "https://flagcdn.com/w40/no.png"},
    {"code": "OM", "name": "Oman", "flag": "https://flagcdn.com/w40/om.png"},
    {
      "code": "PK",
      "name": "Pakistan",
      "flag": "https://flagcdn.com/w40/pk.png",
    },
    {"code": "PW", "name": "Palau", "flag": "https://flagcdn.com/w40/pw.png"},
    {
      "code": "PS",
      "name": "Palestine",
      "flag": "https://flagcdn.com/w40/ps.png",
    },
    {"code": "PA", "name": "Panama", "flag": "https://flagcdn.com/w40/pa.png"},
    {
      "code": "PG",
      "name": "Papua New Guinea",
      "flag": "https://flagcdn.com/w40/pg.png",
    },
    {
      "code": "PY",
      "name": "Paraguay",
      "flag": "https://flagcdn.com/w40/py.png",
    },
    {"code": "PE", "name": "Peru", "flag": "https://flagcdn.com/w40/pe.png"},
    {
      "code": "PH",
      "name": "Philippines",
      "flag": "https://flagcdn.com/w40/ph.png",
    },
    {
      "code": "PN",
      "name": "Pitcairn Islands",
      "flag": "https://flagcdn.com/w40/pn.png",
    },
    {"code": "PL", "name": "Poland", "flag": "https://flagcdn.com/w40/pl.png"},
    {
      "code": "PT",
      "name": "Portugal",
      "flag": "https://flagcdn.com/w40/pt.png",
    },
    {
      "code": "PR",
      "name": "Puerto Rico",
      "flag": "https://flagcdn.com/w40/pr.png",
    },
    {"code": "QA", "name": "Qatar", "flag": "https://flagcdn.com/w40/qa.png"},
    {"code": "RE", "name": "Reunion", "flag": "https://flagcdn.com/w40/re.png"},
    {"code": "RO", "name": "Romania", "flag": "https://flagcdn.com/w40/ro.png"},
    {"code": "RU", "name": "Russia", "flag": "https://flagcdn.com/w40/ru.png"},
    {"code": "RW", "name": "Rwanda", "flag": "https://flagcdn.com/w40/rw.png"},
    {
      "code": "BL",
      "name": "Saint Barthelemy",
      "flag": "https://flagcdn.com/w40/bl.png",
    },
    {
      "code": "SH",
      "name": "Saint Helena",
      "flag": "https://flagcdn.com/w40/sh.png",
    },
    {
      "code": "KN",
      "name": "Saint Kitts and Nevis",
      "flag": "https://flagcdn.com/w40/kn.png",
    },
    {
      "code": "LC",
      "name": "Saint Lucia",
      "flag": "https://flagcdn.com/w40/lc.png",
    },
    {
      "code": "MF",
      "name": "Saint Martin",
      "flag": "https://flagcdn.com/w40/mf.png",
    },
    {
      "code": "PM",
      "name": "Saint Pierre and Miquelon",
      "flag": "https://flagcdn.com/w40/pm.png",
    },
    {
      "code": "VC",
      "name": "Saint Vincent and the Grenadines",
      "flag": "https://flagcdn.com/w40/vc.png",
    },
    {"code": "WS", "name": "Samoa", "flag": "https://flagcdn.com/w40/ws.png"},
    {
      "code": "SM",
      "name": "San Marino",
      "flag": "https://flagcdn.com/w40/sm.png",
    },
    {
      "code": "ST",
      "name": "Sao Tome and Principe",
      "flag": "https://flagcdn.com/w40/st.png",
    },
    {
      "code": "SA",
      "name": "Saudi Arabia",
      "flag": "https://flagcdn.com/w40/sa.png",
    },
    {"code": "SN", "name": "Senegal", "flag": "https://flagcdn.com/w40/sn.png"},
    {"code": "RS", "name": "Serbia", "flag": "https://flagcdn.com/w40/rs.png"},
    {
      "code": "SC",
      "name": "Seychelles",
      "flag": "https://flagcdn.com/w40/sc.png",
    },
    {
      "code": "SL",
      "name": "Sierra Leone",
      "flag": "https://flagcdn.com/w40/sl.png",
    },
    {
      "code": "SG",
      "name": "Singapore",
      "flag": "https://flagcdn.com/w40/sg.png",
    },
    {
      "code": "SX",
      "name": "Sint Maarten",
      "flag": "https://flagcdn.com/w40/sx.png",
    },
    {
      "code": "SK",
      "name": "Slovakia",
      "flag": "https://flagcdn.com/w40/sk.png",
    },
    {
      "code": "SI",
      "name": "Slovenia",
      "flag": "https://flagcdn.com/w40/si.png",
    },
    {
      "code": "SB",
      "name": "Solomon Islands",
      "flag": "https://flagcdn.com/w40/sb.png",
    },
    {"code": "SO", "name": "Somalia", "flag": "https://flagcdn.com/w40/so.png"},
    {
      "code": "ZA",
      "name": "South Africa",
      "flag": "https://flagcdn.com/w40/za.png",
    },
    {
      "code": "KR",
      "name": "South Korea",
      "flag": "https://flagcdn.com/w40/kr.png",
    },
    {
      "code": "SS",
      "name": "South Sudan",
      "flag": "https://flagcdn.com/w40/ss.png",
    },
    {"code": "ES", "name": "Spain", "flag": "https://flagcdn.com/w40/es.png"},
    {
      "code": "LK",
      "name": "Sri Lanka",
      "flag": "https://flagcdn.com/w40/lk.png",
    },
    {"code": "SD", "name": "Sudan", "flag": "https://flagcdn.com/w40/sd.png"},
    {
      "code": "SR",
      "name": "Suriname",
      "flag": "https://flagcdn.com/w40/sr.png",
    },
    {
      "code": "SJ",
      "name": "Svalbard and Jan Mayen",
      "flag": "https://flagcdn.com/w40/sj.png",
    },
    {"code": "SE", "name": "Sweden", "flag": "https://flagcdn.com/w40/se.png"},
    {
      "code": "CH",
      "name": "Switzerland",
      "flag": "https://flagcdn.com/w40/ch.png",
    },
    {"code": "SY", "name": "Syria", "flag": "https://flagcdn.com/w40/sy.png"},
    {"code": "TW", "name": "Taiwan", "flag": "https://flagcdn.com/w40/tw.png"},
    {
      "code": "TJ",
      "name": "Tajikistan",
      "flag": "https://flagcdn.com/w40/tj.png",
    },
    {
      "code": "TZ",
      "name": "Tanzania",
      "flag": "https://flagcdn.com/w40/tz.png",
    },
    {
      "code": "TH",
      "name": "Thailand",
      "flag": "https://flagcdn.com/w40/th.png",
    },
    {
      "code": "TL",
      "name": "Timor-Leste",
      "flag": "https://flagcdn.com/w40/tl.png",
    },
    {"code": "TG", "name": "Togo", "flag": "https://flagcdn.com/w40/tg.png"},
    {"code": "TK", "name": "Tokelau", "flag": "https://flagcdn.com/w40/tk.png"},
    {"code": "TO", "name": "Tonga", "flag": "https://flagcdn.com/w40/to.png"},
    {
      "code": "TT",
      "name": "Trinidad and Tobago",
      "flag": "https://flagcdn.com/w40/tt.png",
    },
    {"code": "TN", "name": "Tunisia", "flag": "https://flagcdn.com/w40/tn.png"},
    {"code": "TR", "name": "Turkey", "flag": "https://flagcdn.com/w40/tr.png"},
    {
      "code": "TM",
      "name": "Turkmenistan",
      "flag": "https://flagcdn.com/w40/tm.png",
    },
    {
      "code": "TC",
      "name": "Turks and Caicos Islands",
      "flag": "https://flagcdn.com/w40/tc.png",
    },
    {"code": "TV", "name": "Tuvalu", "flag": "https://flagcdn.com/w40/tv.png"},
    {"code": "UG", "name": "Uganda", "flag": "https://flagcdn.com/w40/ug.png"},
    {"code": "UA", "name": "Ukraine", "flag": "https://flagcdn.com/w40/ua.png"},
    {
      "code": "AE",
      "name": "United Arab Emirates",
      "flag": "https://flagcdn.com/w40/ae.png",
    },
    {
      "code": "GB",
      "name": "United Kingdom",
      "flag": "https://flagcdn.com/w40/gb.png",
    },
    {
      "code": "US",
      "name": "United States",
      "flag": "https://flagcdn.com/w40/us.png",
    },
    {
      "code": "UM",
      "name": "United States Minor Outlying Islands",
      "flag": "https://flagcdn.com/w40/um.png",
    },
    {"code": "UY", "name": "Uruguay", "flag": "https://flagcdn.com/w40/uy.png"},
    {
      "code": "UZ",
      "name": "Uzbekistan",
      "flag": "https://flagcdn.com/w40/uz.png",
    },
    {"code": "VU", "name": "Vanuatu", "flag": "https://flagcdn.com/w40/vu.png"},
    {
      "code": "VA",
      "name": "Vatican City",
      "flag": "https://flagcdn.com/w40/va.png",
    },
    {
      "code": "VE",
      "name": "Venezuela",
      "flag": "https://flagcdn.com/w40/ve.png",
    },
    {"code": "VN", "name": "Vietnam", "flag": "https://flagcdn.com/w40/vn.png"},
    {
      "code": "WF",
      "name": "Wallis and Futuna",
      "flag": "https://flagcdn.com/w40/wf.png",
    },
    {
      "code": "EH",
      "name": "Western Sahara",
      "flag": "https://flagcdn.com/w40/eh.png",
    },
    {"code": "YE", "name": "Yemen", "flag": "https://flagcdn.com/w40/ye.png"},
    {"code": "ZM", "name": "Zambia", "flag": "https://flagcdn.com/w40/zm.png"},
    {
      "code": "ZW",
      "name": "Zimbabwe",
      "flag": "https://flagcdn.com/w40/zw.png",
    },
  ];
}

class CountryPickerField extends StatefulWidget {
  final Color fillColor;
  final String hintText;
  final List<Map<String, String>> countries;

  const CountryPickerField({
    super.key,
    required this.fillColor,
    required this.hintText,
    required this.countries,
  });

  @override
  State<CountryPickerField> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  final OnboardingController controller = Get.find<OnboardingController>();
  Map<String, String>? selectedCountry;

  void _showCountryPicker() async {
    final picked = await showModalBottomSheet<Map<String, String>>(
      backgroundColor: AppColors.white,
      context: context,
      builder:
          (context) => CountryPickerModal(
            countries: widget.countries,
            selected: selectedCountry,
          ),
    );

    if (picked != null) {
      setState(() {
        selectedCountry = picked;
        controller.countryController.value.text = picked['name']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCountryPicker,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (selectedCountry != null)
              CustomNetworkImage(
                imageUrl: selectedCountry!['flag']!,
                width: 24,
                height: 24,
              )
            else
              SizedBox(width: 24, height: 24),
            SizedBox(width: 12),
            Expanded(
              child: CustomText(
                text:
                    selectedCountry != null
                        ? selectedCountry!['name']!
                        : widget.hintText,

                fontSize: 16,
                textAlign: TextAlign.start,
                color: selectedCountry == null ? Colors.grey : Colors.black,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class CountryPickerModal extends StatefulWidget {
  final List<Map<String, String>> countries;
  final Map<String, String>? selected;

  const CountryPickerModal({super.key, required this.countries, this.selected});

  @override
  State<CountryPickerModal> createState() => _CountryPickerModalState();
}

class _CountryPickerModalState extends State<CountryPickerModal> {
  late List<Map<String, String>> filteredCountries;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = widget.countries;
    searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries =
          widget.countries.where((country) {
            final name = country['name']!.toLowerCase();
            return name.contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: AppColors.primary,
                prefixIcon: Icon(Icons.search),
                hintText: "Search country",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                final isSelected =
                    widget.selected != null &&
                    widget.selected!['code'] == country['code'];
                return ListTile(
                  leading: CustomNetworkImage(
                    imageUrl: country['flag']!,
                    width: 32,
                    height: 20,
                    //  fit: BoxFit.cover,
                  ),
                  title: CustomText(
                    text: country['name']!,
                    textAlign: TextAlign.start,
                  ),
                  trailing:
                      isSelected ? Icon(Icons.check, color: Colors.blue) : null,
                  onTap: () => Navigator.of(context).pop(country),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
