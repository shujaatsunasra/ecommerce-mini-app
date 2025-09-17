import 'package:flutter/material.dart';

class EnhancedSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const EnhancedSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<EnhancedSearchBar> createState() => _EnhancedSearchBarState();
}

class _EnhancedSearchBarState extends State<EnhancedSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onFocusChange(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
    
    if (hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: _isFocused 
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: _isFocused
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 2,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
            ),
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              onTap: () => _onFocusChange(true),
              onTapOutside: (_) => _onFocusChange(false),
              decoration: InputDecoration(
                hintText: 'Search for amazing products...',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: _isFocused
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[500],
                ),
                suffixIcon: widget.controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          widget.controller.clear();
                          widget.onClear();
                          _onFocusChange(false);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey[500],
                        ),
                      )
                    : Icon(
                        Icons.tune,
                        color: Colors.grey[500],
                      ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
