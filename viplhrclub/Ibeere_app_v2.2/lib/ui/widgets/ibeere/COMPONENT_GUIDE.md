// lib/ui/widgets/ibeere/COMPONENT_GUIDE.md
# Ibeere 2.0 Design System - Component Library Guide

## Overview
This document provides a comprehensive guide to the Ibeere 2.0 design system component library. All components are built with the design tokens (colors, spacing, typography) for consistency across the elite-quiz app redesign.

## Quick Import
```dart
// Import all components at once
import 'package:elite_quiz_app/ui/widgets/ibeere/ibeere.dart';

// Or import specific modules
import 'package:elite_quiz_app/ui/widgets/ibeere/buttons.dart';
import 'package:elite_quiz_app/ui/widgets/ibeere/cards.dart';
// ... etc
```

---

## 1. Design Tokens

### Colors (`IbeereColors`)
Centralized color palette with 20+ semantic colors:
- **Primary**: `#007AFF` (iOS Blue) - Main brand color
- **Secondary**: `#5AC8FA` (Cyan) - Secondary actions
- **Accent**: `#FF2D55` (Pink) - Highlights & emphasis
- **Semantic Colors**:
  - `success`: `#34C759` (Green)
  - `warning`: `#FF9500` (Orange)
  - `error`: `#FF3B30` (Red)
- **Grayscale**: `gray100` through `gray900`
- **State Colors**: `disabled`, `overlay`, `shadowColor`

**Usage**:
```dart
Container(
  color: IbeereColors.primary,
  child: Text('Hello', style: TextStyle(color: IbeereColors.white)),
)
```

### Spacing (`IbeereSpacing`)
Responsive spacing scale (dp-based):
- **Scale**: `xs` (4dp), `sm` (8dp), `md` (12dp), `lg` (16dp), `xl` (24dp), `xxl` (32dp), `xxxl` (48dp)
- **Pre-built Padding**: `paddingXs` through `paddingXxl`, horizontal/vertical variants
- **Pre-built Gaps**: `gapXs` through `gapXxl`, for SizedBox use
- **Symmetric Options**: `paddingSymmetricHorizontal`, `paddingSymmetricVertical`

**Usage**:
```dart
Padding(
  padding: IbeereSpacing.paddingMd,
  child: Text('Content'),
)

// Or use gaps
Column(
  children: [
    Widget1(),
    IbeereSpacing.verticalGapMd,
    Widget2(),
  ],
)
```

### Border Radius (`IbeereBorderRadius`)
6 radius levels for consistent corner rounding:
- **Levels**: `radiusXs` (2px), `radiusSm` (4px), `radiusMd` (8px), `radiusLg` (12px), `radiusXl` (16px), `radiusFull` (999px)
- **Directional variants**: `radiusTopMd`, `radiusBottomLg`, etc.

**Usage**:
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: IbeereBorderRadius.radiusMd,
  ),
)
```

### Shadows (`IbeereShadows`)
4 elevation levels with pre-built shadow configurations:
- **Levels**: `sm`, `md`, `lg`, `xl`
- **Shadow Lists**: Ready to use with `boxShadow` property

**Usage**:
```dart
Container(
  decoration: BoxDecoration(
    boxShadow: IbeereShadows.mdList,
  ),
)
```

---

## 2. Button Components

### IbeerePrimaryButton
Main action button - use for primary CTAs.

**Properties**:
- `label` (required): Button text
- `onPressed`: Callback on tap
- `isLoading`: Show spinner, disable button
- `isEnabled`: Enable/disable state
- `isFullWidth`: Stretch to parent width
- `icon`: Optional icon before text
- `height`: Custom height (default 48dp)
- `padding`: Custom padding

**Usage**:
```dart
IbeerePrimaryButton(
  label: 'Continue',
  onPressed: () => Navigator.push(...),
  isFullWidth: true,
  icon: Icon(Icons.arrow_forward),
)

// Loading state
IbeerePrimaryButton(
  label: 'Saving...',
  isLoading: true,
  onPressed: () {},
)
```

### IbeereSecondaryButton
Outlined secondary button - for non-primary actions.

**Properties**: Same as Primary + `borderColor`, `backgroundColor`

**Usage**:
```dart
IbeereSecondaryButton(
  label: 'Cancel',
  onPressed: () => Navigator.pop(context),
  borderColor: IbeereColors.error,
)
```

### IbeereTextButton
Minimal text-only button.

**Properties**: `label`, `onPressed`, `textColor`, `icon`, `isEnabled`

**Usage**:
```dart
IbeereTextButton(
  label: 'Forgot Password?',
  onPressed: () => navigateToReset(),
  textColor: IbeereColors.primary,
)
```

### IbeereIconButton
Icon-only button with background.

**Properties**: `icon`, `onPressed`, `size`, `color`, `backgroundColor`, `iconSize`

**Usage**:
```dart
IbeereIconButton(
  icon: Icons.delete,
  color: IbeereColors.error,
  onPressed: () => deleteItem(),
)
```

### IbeereFAB
Floating Action Button.

**Properties**: `icon`, `label`, `onPressed`, `backgroundColor`, `foregroundColor`, `size`

**Usage**:
```dart
IbeereFAB(
  icon: Icons.add,
  label: 'New Quiz',
  onPressed: () => createNewQuiz(),
)
```

---

## 3. Card Components

### IbeereCard
Base elevated card for content containers.

**Properties**:
- `child` (required): Widget content
- `padding`, `margin`: Spacing
- `onTap`: Tap callback
- `elevation`, `border`, `backgroundColor`: Customization
- `borderRadius`: Corner radius override

**Usage**:
```dart
IbeereCard(
  onTap: () => navigateToDetail(),
  child: Column(
    children: [
      Text('Quiz Title'),
      Text('10 Questions'),
    ],
  ),
)
```

### IbeereQuizCategoryCard
Category tile with icon and optional badge count.

**Properties**: `title`, `subtitle`, `icon`, `backgroundColor`, `iconColor`, `onTap`, `isSelected`, `trailing`

**Usage**:
```dart
IbeereQuizCategoryCard(
  title: 'Science',
  subtitle: '25 Quizzes',
  icon: Icons.science,
  isSelected: categoryId == 'science',
  onTap: () => selectCategory('science'),
)
```

### IbeereOptionCard
Quiz option/answer card with selection state.

**Properties**: `label`, `isSelected`, `isCorrect`, `isIncorrect`, `index`, `selectedColor`, `onTap`

**Usage**:
```dart
// Quiz question options
IbeereOptionCard(
  label: 'Option A',
  index: 0,
  isSelected: selectedIndex == 0,
  onTap: () => selectOption(0),
)

// After quiz completion
IbeereOptionCard(
  label: 'Correct Answer',
  isCorrect: true,
)
```

### IbeereStatsCard
Display statistics/metrics.

**Properties**: `label`, `value`, `icon`, `accentColor`, `onTap`

**Usage**:
```dart
IbeereStatsCard(
  label: 'Accuracy',
  value: '87%',
  icon: Icons.analytics,
  accentColor: IbeereColors.success,
)
```

### IbeereBadgeCard
Badge/achievement display card.

**Properties**: `title`, `description`, `icon`, `backgroundColor`, `iconColor`, `onTap`, `isLocked`

**Usage**:
```dart
IbeereBadgeCard(
  title: 'Quiz Master',
  description: 'Complete 50 quizzes',
  icon: Icons.star,
  isLocked: completedCount < 50,
)
```

---

## 4. Input Components

### IbeereTextField
Base text input field.

**Properties**:
- `controller`: TextEditingController
- `hintText`, `labelText`: Labels
- `helperText`, `errorText`: Supporting text
- `prefixIcon`, `suffixIcon`: Icon widgets
- `keyboardType`, `textInputAction`: Input config
- `onChanged`, `onSubmitted`: Callbacks
- `maxLines`, `minLines`, `maxLength`: Text constraints
- `enabled`, `readOnly`, `obscureText`: State flags

**Usage**:
```dart
IbeereTextField(
  labelText: 'Username',
  hintText: 'Enter your username',
  prefixIcon: Icon(Icons.person),
  onChanged: (value) => updateUsername(value),
  helperText: 'Must be 3-20 characters',
)

// With error
IbeereTextField(
  labelText: 'Email',
  errorText: 'Invalid email format',
)
```

### IbeerePasswordField
Password input with visibility toggle.

**Properties**: `controller`, `labelText`, `helperText`, `errorText`, `onChanged`, `onSubmitted`, `focusNode`

**Usage**:
```dart
IbeerePasswordField(
  controller: passwordController,
  labelText: 'Password',
  onChanged: (value) => validatePassword(value),
)
```

### IbeereEmailField
Email input with validation icon.

**Properties**: Same as TextField + built-in email icon

**Usage**:
```dart
IbeereEmailField(
  controller: emailController,
  errorText: isValidEmail ? null : 'Invalid email',
)
```

### IbeerePhoneField
Phone number input with country code.

**Properties**: `controller`, `labelText`, `countryCode`, `helperText`, `errorText`, `onChanged`

**Usage**:
```dart
IbeerePhoneField(
  controller: phoneController,
  countryCode: '+1',
  hintText: '(555) 123-4567',
)
```

### IbeereSearchField
Search input with clear button.

**Properties**: `controller`, `onChanged`, `onClear`, `hintText`, `autoFocus`

**Usage**:
```dart
IbeereSearchField(
  onChanged: (value) => filterQuizzes(value),
  onClear: () => clearFilter(),
)
```

---

## 5. Navigation Components

### IbeereAppBar
Base app bar with back button and actions.

**Properties**:
- `title`, `titleWidget`: Header text/widget
- `actions`: Action button list
- `onBackPressed`: Back button callback
- `showBackButton`: Toggle back button
- `backgroundColor`, `foregroundColor`: Colors
- `elevation`, `bottom`: Advanced options

**Usage**:
```dart
IbeereAppBar(
  title: 'Quiz Details',
  onBackPressed: () => Navigator.pop(context),
  actions: [
    IconButton(
      icon: Icon(Icons.share),
      onPressed: () => shareQuiz(),
    ),
  ],
)
```

### IbeereAppBarSearch
Search-enabled app bar.

**Properties**: `hintText`, `onChanged`, `onClear`, `controller`, `backgroundColor`

**Usage**:
```dart
IbeereAppBarSearch(
  hintText: 'Search quizzes...',
  onChanged: (value) => searchQuizzes(value),
)
```

### IbeereAppBarMultiAction
App bar with multiple action buttons + overflow menu.

**Properties**: `title`, `actions` (list of `IbeereAppBarAction`), `maxVisibleActions`

**Usage**:
```dart
IbeereAppBarMultiAction(
  title: 'Quiz',
  actions: [
    IbeereAppBarAction(
      icon: Icons.edit,
      onPressed: () => editQuiz(),
    ),
    IbeereAppBarAction(
      icon: Icons.delete,
      onPressed: () => deleteQuiz(),
      color: IbeereColors.error,
    ),
  ],
  maxVisibleActions: 3,
)
```

### IbeereBottomNavBar
Custom bottom navigation bar.

**Properties**:
- `items`: List of `IbeereNavItem` (label, icon, badge)
- `onTap`: Tab selection callback
- `selectedIndex`: Current tab
- `showLabels`, `showBorder`: Visibility options
- `selectedColor`, `unselectedColor`: Colors

**Usage**:
```dart
IbeereBottomNavBar(
  items: [
    IbeereNavItem(label: 'Home', icon: Icons.home),
    IbeereNavItem(label: 'Search', icon: Icons.search),
    IbeereNavItem(label: 'Profile', icon: Icons.person, badge: 2),
  ],
  selectedIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
)
```

### IbeereTabBar
Horizontal tab navigation.

**Properties**: `tabs`, `onTabChanged`, `selectedIndex`, `isScrollable`, `selectedColor`, `unselectedColor`

**Usage**:
```dart
IbeereTabBar(
  tabs: ['Trending', 'Popular', 'Recent'],
  selectedIndex: _selectedTab,
  onTabChanged: (index) => setState(() => _selectedTab = index),
)
```

### IbeereSegmentedControl
Toggle between 2-3 options.

**Properties**: `options` (list of `IbeereSegmentOption`), `selectedValue`, `onChanged`

**Usage**:
```dart
IbeereSegmentedControl<String>(
  options: [
    IbeereSegmentOption(label: 'Easy', value: 'easy'),
    IbeereSegmentOption(label: 'Hard', value: 'hard'),
  ],
  selectedValue: _selectedDifficulty,
  onChanged: (value) => setState(() => _selectedDifficulty = value),
)
```

### IbeereBreadcrumb
Breadcrumb navigation trail.

**Properties**: `items` (list of `IbeereBreadcrumbItem`), `separatorColor`, `textColor`, `activeColor`

**Usage**:
```dart
IbeereBreadcrumb(
  items: [
    IbeereBreadcrumbItem(label: 'Home', onTap: () => navigateHome()),
    IbeereBreadcrumbItem(label: 'Quizzes', onTap: () => navigateQuizzes()),
    IbeereBreadcrumbItem(label: 'Science'),
  ],
)
```

---

## 6. Chip Components

### IbeereChip
Basic tag/chip component.

**Properties**: `label`, `onTap`, `onDelete`, `icon`, `backgroundColor`, `labelColor`, `borderColor`, `fontSize`

**Usage**:
```dart
IbeereChip(
  label: 'Science',
  icon: Icons.tag,
  onTap: () => filterByTag('science'),
  onDelete: () => removeTag('science'),
)
```

### IbeereFilterChip
Selectable filter chip.

**Properties**: `label`, `isSelected`, `onSelected`, `icon`, `selectedColor`, `unselectedColor`

**Usage**:
```dart
IbeereFilterChip(
  label: 'Completed',
  isSelected: _showCompleted,
  onSelected: (value) => setState(() => _showCompleted = value),
)
```

### IbeereCategoryChip
Category chip with badge count.

**Properties**: `label`, `questionCount`, `onTap`, `backgroundColor`, `labelColor`, `isHighlighted`

**Usage**:
```dart
IbeereCategoryChip(
  label: 'Science',
  questionCount: 25,
  isHighlighted: selectedCategory == 'science',
  onTap: () => selectCategory('science'),
)
```

### IbeereDifficultyChip
Difficulty level indicator chip.

**Properties**: `label`, `level` (easy/medium/hard), `onTap`

**Usage**:
```dart
IbeereDifficultyChip(
  label: 'Hard',
  level: DifficultyLevel.hard,
)
```

### IbeereStatusChip
Status badge chip.

**Properties**: `label`, `status` (active/inactive/pending/completed/failed), `onTap`

**Usage**:
```dart
IbeereStatusChip(
  label: 'In Progress',
  status: StatusType.pending,
)
```

---

## 7. Dialog Components

### IbeereAlertDialog
Simple alert dialog with action button(s).

**Properties**:
- `title`, `message`: Dialog content
- `positiveButtonText`, `negativeButtonText`: Button labels
- `onPositivePressed`, `onNegativePressed`: Callbacks
- `icon`, `iconColor`: Optional icon display
- `isDismissible`: Close on tap outside

**Usage**:
```dart
showDialog(
  context: context,
  builder: (context) => IbeereAlertDialog(
    title: 'Delete Quiz?',
    message: 'This action cannot be undone.',
    positiveButtonText: 'Delete',
    negativeButtonText: 'Cancel',
    icon: Icons.warning,
    iconColor: IbeereColors.error,
    onPositivePressed: () => deleteQuiz(),
  ),
)
```

### IbeereConfirmDialog
Confirmation dialog for destructive actions.

**Properties**: `title`, `message`, `actionText`, `cancelText`, `onConfirm`, `onCancel`, `isDangerous`

**Usage**:
```dart
showDialog(
  context: context,
  builder: (context) => IbeereConfirmDialog(
    title: 'Reset Progress?',
    message: 'All quiz progress will be lost.',
    actionText: 'Reset',
    onConfirm: () => resetProgress(),
    isDangerous: true,
  ),
)
```

### IbeereBottomSheet
Bottom modal sheet for selection/input.

**Properties**: `title`, `child`, `padding`, `isDismissible`, `backgroundColor`, `maxHeight`

**Static method**: `IbeereBottomSheet.show()`

**Usage**:
```dart
IbeereBottomSheet.show(
  context,
  title: 'Select Difficulty',
  child: Column(
    children: [
      ListTile(title: Text('Easy'), onTap: () => selectDifficulty('easy')),
      ListTile(title: Text('Hard'), onTap: () => selectDifficulty('hard')),
    ],
  ),
)
```

### IbeereOptionsDialog
Multi-choice selection dialog.

**Properties**: `title`, `options` (list of `IbeereDialogOption`), `onSelected`, `selectedValue`, `allowMultiSelect`

**Usage**:
```dart
showDialog(
  context: context,
  builder: (context) => IbeereOptionsDialog(
    title: 'Select Category',
    options: [
      IbeereDialogOption(label: 'Science', value: 'science'),
      IbeereDialogOption(label: 'History', value: 'history'),
    ],
    onSelected: (value) => selectCategory(value),
  ),
)
```

---

## 8. Snackbar & Toast Components

### IbeereSnackBar
Material snackbar with Ibeere styling.

**Static methods**:
- `show()`: Basic snackbar
- `showSuccess()`: Green success message
- `showError()`: Red error message
- `showWarning()`: Orange warning message
- `showInfo()`: Blue info message

**Usage**:
```dart
IbeereSnackBar.showSuccess(
  context,
  message: 'Quiz completed successfully!',
  duration: Duration(seconds: 3),
)

IbeereSnackBar.showError(
  context,
  message: 'Failed to save progress',
)
```

### IbeereToast
Lightweight overlay toast notification (no ScaffoldMessenger required).

**Static methods**:
- `show()`: Basic toast
- `showSuccess()`, `showError()`, `showWarning()`, `showInfo()`

**Properties**: `position` (top/bottom), `duration`, `type`

**Usage**:
```dart
IbeereToast.showSuccess(
  context,
  message: 'Changes saved',
)

IbeereToast.show(
  context,
  message: 'Loading...',
  type: ToastType.info,
  position: ToastPosition.top,
)
```

---

## Implementation Checklist

- [x] Design System Foundation (Colors, Spacing, BorderRadius, Shadows)
- [x] Button Components (5 variants)
- [x] Card Components (5 variants)
- [x] Input Components (5 variants)
- [x] AppBar Components (3 variants)
- [x] Navigation Components (6 variants)
- [x] Chip Components (5 variants)
- [x] Dialog Components (4 variants)
- [x] Snackbar/Toast Components (2 variants)

**Total Components**: 40+ reusable widget variants

---

## Next Steps: Screen Conversion

With the component library complete, begin converting screens in this order:

### Phase 8: Screen Conversion

**Priority 1 (Critical Path)**:
1. `splash_screen.dart` - Use IbeereCard, text styling
2. `auth/sign_in_screen.dart` - Use TextField, PasswordField, PrimaryButton
3. `auth/sign_up_screen.dart` - Use TextField, PasswordField, PrimaryButton, CheckBox
4. `home/home_screen.dart` - Use BottomNavBar, QuizCategoryCard, StatsCard

**Priority 2 (Core Features)**:
5. `quiz/category_screen.dart` - Use QuizCategoryCard grid
6. `quiz/quiz_screen.dart` - Use OptionCard, ProgressBar
7. `quiz/result_screen.dart` - Use StatsCard, PrimaryButton
8. `profile/create_or_edit_profile_screen.dart` - Use TextField, ProfileCard

**Priority 3 (Monetization & Polish)**:
9. `rewards/rewards_screen.dart` - Use BadgeCard, RewardCard
10. `quiz/contest_leaderboard_screen.dart` - Use LeaderboardCard
11. `inapp_coin_store_screen.dart` - Use CoinPackageCard
12. `app_settings_screen.dart` - Use SettingsCard, Toggle

---

## Design System Documentation

For complete design specifications, see:
- `design_extracted/UI_REDESIGN_SPEC.md` - Architecture & conversion guide
- `design_extracted/design_tokens.json` - Machine-readable design data
- `design_extracted/design_metadata.yaml` - Full XD structure dump

---

## Contributing

When adding new components:
1. Follow the naming convention: `Ibeere<ComponentName>`
2. Use design tokens from `IbeereColors`, `IbeereSpacing`, `IbeereBorderRadius`
3. Support common state variations (enabled/disabled, loading, etc.)
4. Provide sensible defaults while allowing full customization
5. Add to `ibeere.dart` barrel export
6. Document in this guide with usage examples

