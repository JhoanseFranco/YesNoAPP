import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {

final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: PlatformText(
              message.text,
              style: TextStyle(
                color: Colors.white
              ),
              ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(imageUrl: message.imageUrl,),

        SizedBox(height: 5),

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String? imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRect(
      child: Image.network(
        imageUrl ?? "",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null ) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5
            ),
            child: PlatformText("Cargando imagen"),
          );
        },
        )
      );
  }
}