import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImgItem {
  String name; // 名称
  String url;

  ImgItem(this.name, this.url);
}

///打开图片查看器
///index：当前图片index，
///imgItemList：图片集合
void openGalleryPhotoView(
    BuildContext context, final int index, List<ImgItem> imgItemList) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GalleryPhotoViewWrapper(
        galleryItems: imgItemList,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        initialIndex: index,
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder loadingBuilder;
  final BoxDecoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<ImgItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState(initialIndex);
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int _currentIndex;

  _GalleryPhotoViewWrapperState(this._currentIndex);

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: <Widget>[
            ///图片展示Widget
            Align(
              alignment: Alignment.center,
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.galleryItems.length,
                loadingBuilder: widget.loadingBuilder,
                backgroundDecoration: widget.backgroundDecoration,
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: widget.scrollDirection,
              ),
            ),

            ///返回按钮
            Align(
              alignment: Alignment(
                -1.0,
                -0.9,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 14,
                  ),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  }),
            ),

            ///底部文字展示
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.galleryItems[_currentIndex].name}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${_currentIndex + 1}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 22.0,
                            // backgroundColor: Colors.green,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Row(
                            children: [
                              Text(
                                '/',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              Text(
                                "${widget.galleryItems.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 82,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final ImgItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(item.url),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      // heroAttributes: PhotoViewHeroAttributes(tag: 'abc'),
    );
  }
}
