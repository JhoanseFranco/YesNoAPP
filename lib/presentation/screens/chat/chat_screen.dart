import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        leading:  Padding(
          padding: const EdgeInsets.all(4.0),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://pyxis.nymag.com/v1/imgs/230/bed/e9001fb8c73fa9760a409ffdb68c61d6c2-28-elizabeth-olsen.rhorizontal.w700.jpg",
            ),
          ),
        ),
        title: const PlatformText("Chat"),
        material: (_,__) => MaterialAppBarData(centerTitle: false),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            // MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),),
            MessageFieldBox(onValue: chatProvider.sendMessage,),
          ],
        ),
      ),
    );
  }
}
