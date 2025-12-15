// QUICK_REFERENCE.md
# Ibeere 2.0 Component Library - Quick Reference

## Import
```dart
import 'package:elite_quiz_app/ui/widgets/ibeere/ibeere.dart';
```

---

## Design Tokens (Use These Everywhere!)

### Colors
```dart
IbeereColors.primary              // #007AFF (main brand)
IbeereColors.secondary            // #5AC8FA (secondary)
IbeereColors.accent              // #FF2D55 (accent)
IbeereColors.success             // #34C759 (green)
IbeereColors.error               // #FF3B30 (red)
IbeereColors.warning             // #FF9500 (orange)
IbeereColors.gray50 ... gray900  // Grayscale scale
IbeereColors.white
IbeereColors.cardBackground
IbeereColors.withOpacity(color, 0.5)
```

### Spacing
```dart
IbeereSpacing.xs (4dp)    ... IbeereSpacing.xxxl (48dp)
IbeereSpacing.paddingMd            // 12dp padding all
IbeereSpacing.paddingSymmetricHorizontal  // 16dp horizontal
IbeereSpacing.horizontalGapMd      // SizedBox for spacing
```

### Border Radius
```dart
IbeereBorderRadius.radiusXs (2px) ... IbeereBorderRadius.radiusLg (12px)
IbeereBorderRadius.radiusMd        // Use in decoration
```

### Shadows
```dart
IbeereShadows.sm, .md, .lg, .xl
IbeereShadows.smList               // For boxShadow property
```

---

## Buttons (5 Types)

### IbeerePrimaryButton
```dart
IbeerePrimaryButton(
  label: 'Continue',
  onPressed: () {},
  isFullWidth: true,
  isLoading: false,
  icon: Icon(Icons.arrow_forward),
)
```

### IbeereSecondaryButton
```dart
IbeereSecondaryButton(
  label: 'Cancel',
  onPressed: () {},
)
```

### IbeereTextButton
```dart
IbeereTextButton(
  label: 'Forgot Password?',
  onPressed: () {},
  textColor: IbeereColors.primary,
)
```

### IbeereIconButton
```dart
IbeereIconButton(
  icon: Icons.delete,
  onPressed: () {},
  size: 48,
  color: IbeereColors.error,
)
```

### IbeereFAB
```dart
IbeereFAB(
  icon: Icons.add,
  label: 'New',
  onPressed: () {},
)
```

---

## Cards (5 Types)

### IbeereCard
```dart
IbeereCard(
  onTap: () {},
  child: Text('Content'),
)
```

### IbeereQuizCategoryCard
```dart
IbeereQuizCategoryCard(
  title: 'Science',
  subtitle: '25 Quizzes',
  icon: Icons.science,
  isSelected: true,
  onTap: () {},
)
```

### IbeereOptionCard
```dart
IbeereOptionCard(
  label: 'Option A',
  index: 0,
  isSelected: true,
  isCorrect: true,
  onTap: () {},
)
```

### IbeereStatsCard
```dart
IbeereStatsCard(
  label: 'Accuracy',
  value: '87%',
  icon: Icons.analytics,
)
```

### IbeereBadgeCard
```dart
IbeereBadgeCard(
  title: 'Quiz Master',
  description: 'Complete 50 quizzes',
  icon: Icons.star,
  isLocked: false,
)
```

---

## Inputs (5 Types)

### IbeereTextField
```dart
IbeereTextField(
  labelText: 'Username',
  hintText: 'Enter username',
  prefixIcon: Icon(Icons.person),
  onChanged: (value) {},
  errorText: null,
)
```

### IbeerePasswordField
```dart
IbeerePasswordField(
  labelText: 'Password',
  onChanged: (value) {},
)
```

### IbeereEmailField
```dart
IbeereEmailField(
  onChanged: (value) {},
  errorText: null,
)
```

### IbeerePhoneField
```dart
IbeerePhoneField(
  countryCode: '+1',
  onChanged: (value) {},
)
```

### IbeereSearchField
```dart
IbeereSearchField(
  onChanged: (value) {},
  onClear: () {},
)
```

---

## Navigation (6+ Types)

### IbeereAppBar
```dart
IbeereAppBar(
  title: 'Page Title',
  showBackButton: true,
  actions: [
    IconButton(icon: Icon(Icons.share), onPressed: () {}),
  ],
)
```

### IbeereAppBarSearch
```dart
IbeereAppBarSearch(
  hintText: 'Search...',
  onChanged: (value) {},
)
```

### IbeereAppBarMultiAction
```dart
IbeereAppBarMultiAction(
  title: 'Quiz',
  actions: [
    IbeereAppBarAction(icon: Icons.edit, onPressed: () {}),
  ],
)
```

### IbeereBottomNavBar
```dart
IbeereBottomNavBar(
  items: [
    IbeereNavItem(label: 'Home', icon: Icons.home),
    IbeereNavItem(label: 'Profile', icon: Icons.person, badge: 2),
  ],
  selectedIndex: 0,
  onTap: (index) {},
)
```

### IbeereTabBar
```dart
IbeereTabBar(
  tabs: ['Tab1', 'Tab2', 'Tab3'],
  selectedIndex: 0,
  onTabChanged: (index) {},
)
```

### IbeereSegmentedControl
```dart
IbeereSegmentedControl<String>(
  options: [
    IbeereSegmentOption(label: 'Easy', value: 'easy'),
    IbeereSegmentOption(label: 'Hard', value: 'hard'),
  ],
  selectedValue: _selected,
  onChanged: (value) {},
)
```

### IbeereBreadcrumb
```dart
IbeereBreadcrumb(
  items: [
    IbeereBreadcrumbItem(label: 'Home', onTap: () {}),
    IbeereBreadcrumbItem(label: 'Quizzes'),
  ],
)
```

---

## Chips (5 Types)

### IbeereChip
```dart
IbeereChip(
  label: 'Science',
  icon: Icons.tag,
  onDelete: () {},
)
```

### IbeereFilterChip
```dart
IbeereFilterChip(
  label: 'Completed',
  isSelected: true,
  onSelected: (value) {},
)
```

### IbeereCategoryChip
```dart
IbeereCategoryChip(
  label: 'Science',
  questionCount: 25,
  isHighlighted: true,
  onTap: () {},
)
```

### IbeereDifficultyChip
```dart
IbeereDifficultyChip(
  label: 'Hard',
  level: DifficultyLevel.hard,
)
```

### IbeereStatusChip
```dart
IbeereStatusChip(
  label: 'In Progress',
  status: StatusType.pending,
)
```

---

## Dialogs (4 Types)

### IbeereAlertDialog
```dart
showDialog(
  context: context,
  builder: (_) => IbeereAlertDialog(
    title: 'Delete?',
    message: 'Cannot be undone.',
    positiveButtonText: 'Delete',
    negativeButtonText: 'Cancel',
    icon: Icons.warning,
    onPositivePressed: () {},
  ),
)
```

### IbeereConfirmDialog
```dart
showDialog(
  context: context,
  builder: (_) => IbeereConfirmDialog(
    title: 'Reset?',
    message: 'All progress will be lost.',
    actionText: 'Reset',
    onConfirm: () {},
    isDangerous: true,
  ),
)
```

### IbeereBottomSheet
```dart
IbeereBottomSheet.show(
  context,
  title: 'Select',
  child: ListView(children: [...]),
)
```

### IbeereOptionsDialog
```dart
showDialog(
  context: context,
  builder: (_) => IbeereOptionsDialog(
    title: 'Choose',
    options: [
      IbeereDialogOption(label: 'Option 1', value: 1),
      IbeereDialogOption(label: 'Option 2', value: 2),
    ],
    onSelected: (value) {},
  ),
)
```

---

## Snackbars & Toasts

### SnackBar (Use with ScaffoldMessenger)
```dart
// Success
IbeereSnackBar.showSuccess(context, message: 'Saved!');

// Error
IbeereSnackBar.showError(context, message: 'Failed');

// Warning
IbeereSnackBar.showWarning(context, message: 'Warning');

// Info
IbeereSnackBar.showInfo(context, message: 'Info');
```

### Toast (No ScaffoldMessenger needed)
```dart
// Success
IbeereToast.showSuccess(context, message: 'Saved!');

// Error
IbeereToast.showError(context, message: 'Failed');

// With position
IbeereToast.show(
  context,
  message: 'Loading',
  position: ToastPosition.top,
)
```

---

## Common Patterns

### Full-Width Button
```dart
IbeerePrimaryButton(
  label: 'Submit',
  onPressed: () {},
  isFullWidth: true,
)
```

### Loading State
```dart
IbeerePrimaryButton(
  label: 'Saving...',
  onPressed: () {},
  isLoading: true,
)
```

### Disabled Button
```dart
IbeerePrimaryButton(
  label: 'Submit',
  onPressed: () {},
  isEnabled: false,
)
```

### Form with Validation
```dart
IbeereTextField(
  labelText: 'Email',
  errorText: isValidEmail ? null : 'Invalid email',
)
```

### Centered Column Layout
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Widget1(),
    IbeereSpacing.verticalGapLg,  // 16dp gap
    Widget2(),
  ],
)
```

### Styled Container
```dart
Container(
  decoration: BoxDecoration(
    color: IbeereColors.cardBackground,
    borderRadius: IbeereBorderRadius.radiusMd,
    boxShadow: IbeereShadows.smList,
  ),
  padding: IbeereSpacing.paddingMd,
  child: Text('Content'),
)
```

---

## Tips & Best Practices

1. **Always use design tokens**: Never hardcode colors, spacing, or radius
2. **Use gaps for spacing**: Prefer `IbeereSpacing.verticalGapMd` over hardcoded SizedBox
3. **One import file**: `import '.../ibeere/ibeere.dart'` gets everything
4. **Callbacks**: All interactive components support callbacks for state management
5. **Loading states**: Use `isLoading` flag for async operations
6. **Icons**: All components support Material icons
7. **Customization**: Every component allows color/size customization while providing defaults
8. **Accessibility**: All components include proper touch targets (48dp minimum)

---

## Component Count Summary

| Category | Count | Components |
|----------|-------|------------|
| Design Tokens | 40+ | Colors, Spacing, Radius, Shadows |
| Buttons | 5 | Primary, Secondary, Text, Icon, FAB |
| Cards | 5 | Base, Category, Option, Stats, Badge |
| Inputs | 5 | Text, Password, Email, Phone, Search |
| Navigation | 6+ | AppBar, BottomNav, Tabs, Segmented, Breadcrumb |
| Chips | 5 | Basic, Filter, Category, Difficulty, Status |
| Dialogs | 4 | Alert, Confirm, BottomSheet, Options |
| Feedback | 2 | SnackBar, Toast |
| **TOTAL** | **40+** | **Production-ready components** |

---

**Last Updated**: Component Library Phase Complete
**Status**: ✅ Ready for screen conversion
**Documentation**: See COMPONENT_GUIDE.md for detailed examples
