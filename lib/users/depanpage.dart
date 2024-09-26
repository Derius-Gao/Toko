import 'dart:convert'; // To decode JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonline/model/kategori.dart'; // Ensure correct import path
import 'package:tokoonline/constans.dart'; // Palette.sUrl is defined here
import 'package:tokoonline/model/produk.dart'; // Ensure correct import path
import 'package:tokoonline/users/produkdetailpage.dart';

// Improved error handling and informative messages
class DepanPage extends StatefulWidget {
  @override
  State<DepanPage> createState() => _DepanPageState();
}

class _DepanPageState extends State<DepanPage> {
  List<Kategori> kategoriList = [];

  @override
  void initState() {
    super.initState();
    fetchKategori();
  }

  @override
  void dispose() {
    kategoriList.clear();
    super.dispose();
  }

  Future<void> fetchKategori() async {
    var params = "/kategoribyproduk";
    try {
      var response = await http.get(Uri.parse(Palette.sUrl + params));
      if (response.statusCode == 200) {
        final List<dynamic> jsonItems = json.decode(response.body);
        List<Kategori> usersList = jsonItems.map<Kategori>((json) {
          return Kategori.fromJson(json);
        }).toList();

        setState(() {
          kategoriList = usersList;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load categories: Status code ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      print("Error fetching kategori: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching categories: $e'),
        ),
      );
    }
  }

  Future<void> _refresh() async {
    await fetchKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              produkbyKategori(),
            ],
          ),
        ),
      ),
    );
  }

  Widget produkbyKategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < kategoriList.length; i++)
          WidgetbyKategori(
            kategoriList[i].id,
            kategoriList[i].nama.toString(),
            i,
          ),
      ],
    );
  }
}

class WidgetbyKategori extends StatefulWidget {
  final int id;
  final String kategori;
  final int warna;

  WidgetbyKategori(this.id, this.kategori, this.warna, {Key? key}) : super(key: key);

  @override
  _WidgetbyKategoriState createState() => _WidgetbyKategoriState();
}

class _WidgetbyKategoriState extends State<WidgetbyKategori> {
  Future<List<Produk>> fetchProduk(String id) async {
    var params = "/produkbykategori?id=" + id;
    try {
      var response = await http.get(Uri.parse(Palette.sUrl + params));
      if (response.statusCode == 200) {
        final List<dynamic> jsonItems = json.decode(response.body);
        return jsonItems.map<Produk>((json) {
          return Produk.fromJson(json);
        }).toList();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load products: Status code ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      print("Error fetching produk: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching products: $e'),
        ),
      );
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.only(right: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.kategori,
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: 200.0,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Palette.colors[widget.warna],
                    boxShadow: [
                      BoxShadow(
                        color: Palette.colors[widget.warna],
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigate to a detailed page if needed
                  },
                  child: const Text('Selengkapnya', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: const EdgeInsets.only(bottom: 7.0),
            child: FutureBuilder<List<Produk>>(
              future: fetchProduk(widget.id.toString()),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int i) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProdukDetailPage(
                              snapshot.data![i].id,
                              snapshot.data![i].judul,
                              snapshot.data![i].harga,
                              snapshot.data![i].hargax,
                              snapshot.data![i].thumbnail,
                              false, // Assuming this is a required parameter
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 135.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              '/' + snapshot.data![i].thumbnail,
                              height: 110.0,
                              width: 110.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(snapshot.data![i].judul),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(snapshot.data![i].harga),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
