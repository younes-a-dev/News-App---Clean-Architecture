import 'package:flutter/material.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/presentation/screens/article_detail_screen.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;

  const ArticleWidget({
    Key? key,
    this.article,
    this.isRemovable = false,
    this.onRemove,
    this.onArticlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (onArticlePressed != null) {
          onArticlePressed!(article!);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        height: size.width / 2.2,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                '${article!.urlToImage}',
                height: double.maxFinite,
                width: size.width / 3,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      article!.title ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Butler',
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),

                    // Description
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          article!.description ?? '',
                          maxLines: 2,
                        ),
                      ),
                    ),

                    // Datetime
                    Row(
                      children: [
                        const Icon(Icons.timeline_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          article!.publishedAt!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isRemovable!
                ? GestureDetector(
                    onTap: () {
                      if (onRemove != null) {
                        onRemove!(article!);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.remove_circle_outline,color:Colors.red),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
