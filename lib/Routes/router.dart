import 'package:get/route_manager.dart';
import 'package:penjualan/Halaman/Halaman1.dart';
import 'package:penjualan/Halaman/Halaman2.dart';
import 'package:penjualan/Halaman/Halaman3.dart';
import 'package:penjualan/Halaman/Halaman4.dart';
import 'package:penjualan/Halaman/Halaman5.dart';
import 'package:penjualan/Halaman/Halaman6.dart';
import 'package:penjualan/Menu/MenuHomeBottom.dart';
import 'package:penjualan/Pages/Halaman-Barang/barang.dart';
import 'package:penjualan/Pages/Halaman-Barang/tambahBarang.dart';
import 'package:penjualan/Pages/Halaman-Barang/ubahBarang.dart';
import 'package:penjualan/Pages/Halaman-Jenis/tambahJenis.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/det.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/detailTransaksi.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/rekapTransaksi.dart';
import 'package:penjualan/Pages/Halaman-pengguna/tambahPengguna.dart';
import 'package:penjualan/Pages/Halaman-pengguna/ubahPengguna.dart';
import 'package:penjualan/Pages/Halaman-Jenis/jenis.dart';
import 'package:penjualan/Pages/Halaman-pengguna/pengguna.dart';
import 'package:penjualan/Pages/profile.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/transaksiKeluar.dart';
import 'package:penjualan/home.dart';
import 'package:penjualan/login.dart';

List<GetPage> get getRouterPages => _routerPages;

List<GetPage> _routerPages = [
  GetPage(name: HomeBottomMenu.routeName, page: () => const HomeBottomMenu()),
  GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
  GetPage(name: MyHomePage.routeName, page: () => const MyHomePage()),
  GetPage(name: DataBarang.routeName, page: () => const DataBarang()),
  GetPage(name: TambahBarang.routeName, page: () => const TambahBarang()),
  GetPage(name: UbahBarang.routeName, page: () => const UbahBarang()),

  GetPage(name: Profile.routeName, page: () => const Profile()),

  GetPage(name: DataJenis.routeName, page: () => const DataJenis()),
  GetPage(name: TambahDataJenis.routeName, page: () => const TambahDataJenis()),
  GetPage(name: DataPengguna.routeName, page: () => const DataPengguna()),
  GetPage(
      name: TambahDataPengguna.routeName,
      page: () => const TambahDataPengguna()),
  GetPage(name: UbahPengguna.routeName, page: () => const UbahPengguna()),

  GetPage(name: TransaksiKeluar.routeName, page: () => const TransaksiKeluar()),
  GetPage(
      name: DetailTransaksiKeluar.routeName,
      page: () => const DetailTransaksiKeluar()),

  GetPage(name: RekapTransaksi.routeName, page: () => const RekapTransaksi()),
  GetPage(name: DetailRekap.routeName, page: () => const DetailRekap()),
  //
  GetPage(name: HalamanSatu.routeName, page: () => const HalamanSatu()),
  GetPage(name: HalamanDua.routeName, page: () => const HalamanDua()),
  GetPage(name: HalamanTiga.routeName, page: () => const HalamanTiga()),
  GetPage(name: HalamanEmpat.routeName, page: () => const HalamanEmpat()),
  GetPage(name: HalamanLima.routeName, page: () => const HalamanLima()),
  GetPage(name: HalamanEnam.routeName, page: () => const HalamanEnam()),
];
