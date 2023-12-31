import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:temres_apps/app/core/constant/color.dart';
import 'package:temres_apps/app/core/constant/text_styles.dart';
import 'package:temres_apps/app/core/helper/base_controller.dart';
import 'package:temres_apps/app/core/widget/button_fill.dart';
import 'package:temres_apps/app/modules/pendukung/controllers/tambah_controller.dart';
import 'package:temres_apps/app/routes/app_pages.dart';

import '../../../core/constant/strings.dart';
import '../../../core/widget/field_outline.dart';
import '../../../core/widget/form_option.dart';
import '../../../core/widget/form_option_cb.dart';
import '../../../core/widget/form_option_kec.dart';
import '../../../core/widget/form_option_kel.dart';
import '../../../core/widget/image/image_controller.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class TambahView extends GetView<TambahController> with BaseController {
  TambahView({Key? key}) : super(key: key);
  final ImageController imageController = Get.put(ImageController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PallateColors().primaryColor,
          title: const Text('Tambah Pendukung'),
          centerTitle: true,
        ),
        body: Obx(
          () => SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Form(
                key: controller.pendukungFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lengkapi Data Survey',
                                  style: TextStyle(
                                    color: Color(0xFF59676C),
                                    fontSize: 25,
                                    fontFamily: 'Sen',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Forms(
                    //   contrroler: controller.nik,
                    //   enable: true,
                    //   hintext: 'Contoh: 747203081098288',
                    //   label: 'NIK',
                    //   obscureText: false,
                    //   suffixText: '',
                    //   typeKeyboard: TextInputType.number,
                    //   validator: (value) {
                    //     return controller.validateForm(value!);
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.nama,
                      enable: true,
                      hintext: 'Contoh: Jonh Lemos',
                      label: 'Nama Lengkap',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.text,
                      validator: (value) {
                        return controller.validateForm(value!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.hp,
                      enable: true,
                      hintext: 'Contoh: 085255xxxx',
                      label: 'No HP aktif',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.number,
                      validator: (value) {
                        return controller.validateNoHP(value!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.umur,
                      enable: true,
                      hintext: 'Contoh: 25',
                      label: 'Umur',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.number,
                      validator: (value) {
                        return controller.validateForm(value!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormOption(
                      controller: controller.jk,
                      options: genderItems,
                      title: 'Jenis Kelamin',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: false,
                      child: Text(controller.kabupatenList.join(" ")),
                    ),
                    FormOptionCb(
                        controller: controller.kabupaten,
                        options: controller.kabupatenList,
                        title: 'Kabupaten/Kota',
                        onChangedCallback: (value) =>
                            {controller.getKecamatan(value)}),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: false,
                      child: Text(controller.kecamatanList.join(" ")),
                    ),
                    FormOptionKec(
                        controller: controller.kecamatan,
                        options: controller.kecamatanList,
                        title: 'Kecamatan',
                        onChangedCallback: (value) =>
                            {controller.getKelurahan(value)}),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: false,
                      child: Text(controller.kelurahanList.join(" ")),
                    ),
                    FormOptionKel(
                        controller: controller.kelurahan,
                        options: controller.kelurahanList,
                        title: 'Kelurahan/Desa',
                        onChangedCallback: () => {print('asdfadf')}),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.alamat,
                      enable: true,
                      hintext: 'Contoh: Jalan Srikaya No. 02',
                      label: 'Alamat',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.text,
                      validator: (value) {
                        return controller.validateForm(value!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.rw,
                      enable: (controller.rw.text == '0') ? true : false,
                      hintext: 'Contoh: 01',
                      label: 'RW',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.number,
                      validator: (value) {
                        return controller.validateForm(value!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      contrroler: controller.rt,
                      enable: (controller.rt.text == '0') ? true : false,
                      hintext: 'Contoh: 01',
                      label: 'RT',
                      obscureText: false,
                      suffixText: '',
                      typeKeyboard: TextInputType.number,
                      validator: (value) {
                        return controller.validateForm(value!);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormOption(
                      controller: controller.pilihanPartai2019,
                      options: partai2019Items,
                      title: 'Pilihan Partai tahun lalu',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormOption(
                      controller: controller.pilihanPartai,
                      options: partai2024Items,
                      title: 'Pilihan Partai tahun 2024',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jika tidak memilih PDIP, apakah bisa berubah?',
                          style: mLabelStyle,
                        ),
                        RadioGroup<String>.builder(
                          groupValue: controller.jpilihan.value,
                          onChanged: (value) {
                            controller.jpilihan.value = value!;

                            (value == controller.pilihanList[0])
                                ? controller.jpilihanValue.value = '1'
                                : (value == controller.pilihanList[1])
                                    ? controller.jpilihanValue.value = '2'
                                    : "0";
                            print("jp pilihan " + controller.jpilihanValue.value);
                            setState() {
                              controller.jpilihanHasSelected = true;
                            }
                          },
                          items: controller.pilihanList,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilihan Presiden',
                          style: mLabelStyle,
                        ),
                        RadioGroup<String>.builder(
                          groupValue: controller.jpilihanCapres.value,
                          onChanged: (value) {
                            controller.jpilihanCapres.value = value!;
                            if (value == controller.capresList[0]) {
                              controller.jpilihanCapresValue.value = '1';
                            } else if (value == controller.capresList[1]) {
                              controller.jpilihanCapresValue.value = '2';
                            } else if (value == controller.capresList[2]) {
                              controller.jpilihanCapresValue.value = '3';
                            } else {
                              controller.jpilihanCapresValue.value = '3';
                            }

                            print(controller.jpilihanCapresValue.value);
                          },
                          items: controller.capresList,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (() {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  "Pilih foto",
                                  style: mLabelStyle,
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          // showLoading('loading Progres');
                                          Future.delayed(
                                              const Duration(microseconds: 100),
                                              () {
                                            hideLoading();
                                            Get.toNamed(Routes.CAMERA,
                                                parameters: {"image": "1"});
                                          });
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.camera_alt,
                                              size: 30,
                                              color: imageController
                                                  .pallateColors.primaryColor,
                                            ),
                                            Text(
                                              'Camera',
                                              style: kHintTextStyle,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      kIsWeb ? const SizedBox() : InkWell(
                                        onTap: () {
                                          Get.back();

                                          Future.delayed(
                                              const Duration(microseconds: 100),
                                              () {
                                            hideLoading();
                                            imageController.fileImage('1', context);
                                          });
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.photo_album,
                                              size: 30,
                                              color: imageController
                                                  .pallateColors.primaryColor,
                                            ),
                                            Text('Galeri',
                                                style: kHintTextStyle)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                          child: SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Obx(
                              () => imageController.cropImagePath.value == ''
                                  ? Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                PallateColors().primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        // 'Kirim Foto\r\n * tidak wajib',
                                        'Kirim Foto',
                                        style: kHintTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          color: controller
                                              .pallateColors.bgNavBarColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: kIsWeb ? Image.network(
                                        imageController.cropImagePath.value,
                                        width: double.infinity,
                                        height: 300,
                                      ) : Image.file(
                                        File(imageController
                                            .cropImagePath.value),
                                        width: double.infinity,
                                        height: 300,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    ButtonFill(
                        label: "Simpan & Kirim Sekarang",
                        onPressed: () {
                          controller.addPendukung(context);
                        },

                        color: PallateColors().primaryColor),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonFill(
                        label: "Simpan & Kirim nanti",
                        onPressed: () {
                          controller.addPendukungUploadCheck(context);
                        },
                        color: PallateColors().primaryColor),
                  ],
                ),
              )),
        ));
  }
}
