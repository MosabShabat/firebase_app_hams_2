import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utlis/helpers.dart';

class ImagesScreen extends StatefulWidget {

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/upload_image_screen',
            ),
            icon: const Icon(Icons.upload),
          ),
        ],
      ),
      // body: BlocConsumer<ImagesBloc, CrudState>(
      //   listenWhen: (previous, current) =>
      //       current is ProcessState &&
      //       current.processType == ProcessType.delete,
      //   listener: (context, state) {
      //     state as ProcessState;
      //     showSnackBar(context, message: state.message, error: !state.success);
      //   },
      //   buildWhen: (previous, current) =>
      //       current is ReadState || current is LoadingState,
      //   builder: (context, state) {
      //     if (state is LoadingState) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (state is ReadState && state.references.isNotEmpty) {
      //       return GridView.builder(
      //         itemCount: state.references.length,
      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10,
      //         ),
      //         itemBuilder: (context, index) {
      //           return Card(
      //             clipBehavior: Clip.antiAlias,
      //             elevation: 5,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: Stack(
      //               fit: StackFit.expand,
      //               children: [
      //                 FutureBuilder<String>(
      //                     future: state.references[index].getDownloadURL(),
      //                     builder: (context, snapshot) {
      //                       if (snapshot.connectionState ==
      //                           ConnectionState.waiting) {
      //                         return const Center(
      //                           child: CircularProgressIndicator(),
      //                         );
      //                       } else if (snapshot.hasData) {
      //                         return CachedNetworkImage(
      //                           cacheKey: state.references[index].name,
      //                           imageUrl: snapshot.data!,
      //                           fit: BoxFit.cover,
      //                           progressIndicatorBuilder:
      //                               (context, url, downloadProgress) => Center(
      //                             child: CircularProgressIndicator(
      //                               value: downloadProgress.progress,
      //                             ),
      //                           ),
      //                           errorWidget: (context, url, error) =>
      //                               const Icon(Icons.error),
      //                         );
      //                       } else {
      //                         return const Icon(Icons.image);
      //                       }
      //                     }),
      //                 Align(
      //                   alignment: AlignmentDirectional.bottomEnd,
      //                   child: Container(
      //                     height: 50,
      //                     width: double.infinity,
      //                     color: Colors.black45,
      //                     padding: const EdgeInsets.symmetric(horizontal: 10),
      //                     child: Row(
      //                       children: [
      //                         Expanded(
      //                           child: Text(
      //                             state.references[index].name,
      //                             maxLines: 1,
      //                             overflow: TextOverflow.ellipsis,
      //                             style: GoogleFonts.montserrat(
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                         IconButton(
      //                           onPressed: () async =>
      //                               _deleteImage(index: index),
      //                           icon: const Icon(
      //                             Icons.delete,
      //                             color: Colors.red,
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(
      //         child: Text(
      //           'No Data',
      //           style: GoogleFonts.montserrat(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  void _deleteImage({required int index}) {
    // BlocProvider.of<ImagesBloc>(context).add(DeleteEvent(index: index));
  }
}
