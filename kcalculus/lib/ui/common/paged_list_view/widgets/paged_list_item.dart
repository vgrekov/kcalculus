import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/utils/l10n.dart';

class PagedListItem<Model> extends StatelessWidget with WidgetMessenger {
  const PagedListItem({
    super.key,
    required this.item,
    required this.itemBuilder,
    this.onDeleteItem,
    this.deletableTest,
    this.confirmDeleteMessage,
    this.listStyle,
  });

  final Model item;

  final Widget Function(BuildContext, Model) itemBuilder;

  final void Function(Model)? onDeleteItem;

  final bool Function(Model)? deletableTest;

  final String? Function(Model)? confirmDeleteMessage;

  final ListStyle? listStyle;

  @override
  Widget build(BuildContext context) {
    final listStyle =
        this.listStyle ?? Theme.of(context).extension<ListStyle>();

    final itemWidget = itemBuilder(context, item);

    return Container(
      margin: (listStyle?.horizontalGap ?? 0) > 0
          ? EdgeInsets.symmetric(
              horizontal: listStyle!.horizontalGap,
            )
          : null,
      child: Material(
        borderRadius: listStyle?.itemBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: onDeleteItem == null || !(deletableTest?.call(item) ?? true)
            ? itemWidget
            : Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await showConfirmation(
                        context,
                        confirmDeleteMessage?.call(item) ??
                            l10n(context).messageDeletionConfirmation,
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  onDeleteItem!(item);
                },
                background: Container(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.delete,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
                child: itemWidget,
              ),
      ),
    );
  }
}
