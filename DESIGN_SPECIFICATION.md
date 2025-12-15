# Ibeere App v2.2 - Complete Design Specification

## 🎨 Complete Design System Analysis

### Brand Identity
**Logo**: "ébeere" with playful decorative elements
- Purple gradient text (#6366F1 → #7C3AED)
- Small decorative shapes around logo (sparks, confetti)
- "Games" subtitle in smaller text with arrow decorations

### Color System (Exact Values)

#### Primary Colors
```dart
Purple Primary: #6366F1 (indigo-500)
Purple Dark: #5B21B6 (violet-800)
Pink: #EC4899 (pink-500)
Red: #EF4444 (red-500)
```

#### Background Colors
```dart
Background: #FAFAFA → #FFFFFF gradient
Card Background: #FFFFFF
Input Background: #F1F5F9 (slate-100)
```

#### Text Colors
```dart
Heading: #475569 (slate-600)
Body: #64748B (slate-500)
Placeholder: #94A3B8 (slate-400)
Link Red: #DC2626 (red-600)
```

#### Decorative Shapes
```dart
Pink Circle: #FFB6C1 with 30% opacity
Green Circle: #86EFAC with 30% opacity
Yellow Circle: #FDE68A with 30% opacity
Cyan Triangle: #67E8F9 with 30% opacity
Purple Square: #D8B4FE with 30% opacity
Gray Diamond: #CBD5E1 with 30% opacity
```

### Typography Scale

```dart
// Font: Nunito or Poppins
Heading Large: 32px / 700 weight
Heading: 24px / 700 weight
Title: 20px / 600 weight
Subtitle: 16px / 600 weight
Body: 14px / 400 weight
Small: 12px / 400 weight
Button: 16px / 600 weight
```

### Layout System

#### Spacing
```dart
Horizontal Padding: 24px
Vertical Spacing: 16px, 24px, 32px
Card Padding: 20px
Input Field Height: 56px
Button Height: 56px
Icon Size: 24px
Avatar Small: 40px
Avatar Medium: 64px
Avatar Large: 120px
```

#### Border Radius
```dart
Small: 12px (cards, inputs)
Medium: 20px (larger cards)
Large: 28px (buttons - pill shaped)
Circle: 999px (avatars, decorative elements)
```

#### Shadows
```dart
Card Shadow:
  - Offset: (0, 4)
  - Blur: 12
  - Color: rgba(0, 0, 0, 0.08)

Button Shadow:
  - Offset: (0, 6)
  - Blur: 16
  - Color: rgba(0, 0, 0, 0.12)

Floating Action Button:
  - Offset: (0, 8)
  - Blur: 24
  - Color: rgba(239, 68, 68, 0.4)
```

### Component Specifications

#### Buttons

**Primary Button (Red)**
- Background: #EF4444
- Text: #FFFFFF, 16px, weight 600
- Height: 56px
- Border Radius: 28px
- Shadow: (0, 6, 16, rgba(239, 68, 68, 0.3))
- Padding: 24px horizontal

**Secondary Button (Purple)**
- Background: #6366F1
- Text: #FFFFFF, 16px, weight 600
- Same dimensions as primary

**Outlined Button**
- Border: 2px solid #E2E8F0
- Text: #475569, 16px, weight 600
- Background: transparent

**Social Login Buttons**
- Google: White background, colored Google logo
- Apple: White background, black Apple logo
- Height: 52px
- Border Radius: 26px
- Shadow: subtle (0, 2, 8, rgba(0,0,0,0.05))

#### Input Fields

**Text Input**
- Background: #F1F5F9
- Border: none (default), 2px #6366F1 (focused)
- Border Radius: 12px
- Height: 56px
- Padding: 16px
- Placeholder: #94A3B8
- Text: #475569

**OTP Input**
- Individual boxes for each digit
- Size: 48x56px each
- Background: #F1F5F9
- Border Radius: 8px
- Gap between boxes: 8px
- Text: center aligned, 24px, weight 600

#### Cards

**Question Card**
- Background: #FFFFFF
- Border Radius: 20px
- Padding: 20px
- Shadow: (0, 4, 12, rgba(0,0,0,0.08))
- Left Border: 4px solid #EF4444 or #6366F1
- Decorative shapes: floating in corners

**Category Card**
- Background: #FFFFFF
- Border Radius: 16px
- Padding: 16px
- Icon at top
- Title below
- Optional lock icon for premium

#### Navigation

**Bottom Navigation Bar**
- Height: 72px
- Background: #FFFFFF
- Shadow: (0, -2, 8, rgba(0,0,0,0.05))
- Items: 4-5 tabs
- Active color: #6366F1
- Inactive color: #94A3B8
- Icon size: 24px
- Label: 12px

**Tab Bar (Top)**
- Pills style
- Active: #6366F1 background, white text
- Inactive: transparent, #64748B text
- Height: 40px
- Border Radius: 20px

#### Floating Action Button

**Red Play Button**
- Size: 64x64px
- Background: #EF4444
- Icon: white play triangle
- Border Radius: 32px
- Shadow: (0, 8, 24, rgba(239, 68, 68, 0.4))
- Position: bottom right, 24px from edges
- Decorative circles around button

---

## 📱 Screen-by-Screen Specifications

### Authentication Screens

#### Sign In Screen (11_sign_in_screen_2.jpg)
```dart
Layout:
- ébeere Games logo at top (with decorations)
- Email input field
- Password input field
- "Forgot Password?" link (right aligned, red)
- "Sign In" button (red, full width)
- "or continue with" divider
- Social login buttons (Google, Apple)
- "Don't have an account? Sign Up" (centered, bottom)
- Decorative shapes scattered throughout
- Red FAB at bottom right

Measurements:
- Logo size: ~150px wide
- Top padding: 80px
- Input spacing: 16px
- Button spacing: 24px
```

#### OTP Screen (04_onboarding_screen_5.jpg)
```dart
Layout:
- Logo at top
- "Enter the 6-digit Code sent to"
- Phone number display (+229 90 01 02 03)
- 6 OTP input boxes in a row
- "Resend Code in 55s" timer
- "Resend OTP" link (red)
- Terms of service text
- "Back" button (circular, outlined)
- Red FAB at bottom right

OTP Boxes:
- 6 boxes, each 48x56px
- Background: #F1F5F9
- Border Radius: 8px
- Gap: 8px
- Asterisk placeholder
```

### Home & Quiz Screens

#### Home Screen Question Card (21_home_screen_1.jpg)
```dart
Card Structure:
- White background (#FFFFFF)
- Border Radius: 20px
- Left border: 4px red accent
- Padding: 20px
- Shadow: subtle elevation

Content:
- Question number tag (top right): "1 | 5 Questions"
- Question text: 16px, #475569, multi-line
- Decorative shapes in corners
- Clean whitespace

Decorative Shapes Per Card:
- Top left: small purple square
- Top right: yellow circle
- Bottom: cyan triangle, red circle
```

#### Referral Screen (21_home_screen_2.jpg)
```dart
Components:
1. Hero Card:
   - Purple gradient background (#5B21B6 → #6366F1)
   - Megaphone illustration (right side)
   - Title: "Refer your friends"
   - Subtitle: "& Earn Commissions!"
   - Decorative shapes overlay
   - Border Radius: 24px

2. Avatar Grid:
   - 3D character avatars in circles
   - Various background colors (cyan, black, pink, green, purple, yellow)
   - Size: 80x80px
   - Gap: 16px
   - Grid: 4 columns, 2 rows

3. Referral Code Display:
   - "Your Referral Code" label
   - Individual letter circles: 0 W L N 5 3 9 2
   - "Click to copy Code" button below

4. Rewards Info:
   - "500 Kauris" (large, bold, purple)
   - "Invite your friends to join & earn Kauris as Reward."
   - "You will get | 500 Kauris"
   - "They will get | 500 Kauris"

5. Action Button:
   - "Share now" with share icon
   - Red background
   - Full width
   - Bottom of screen

6. Help Link:
   - "How it works ? Steps"
   - Small, bottom center
```

---

## 🔧 Implementation Priority Order

### CRITICAL PATH (Must implement first)
1. ✅ Design Tokens & System
2. **Splash Screen** (01_splash_screen_1.jpg)
3. **Phone Login** (04_onboarding_screen_4.jpg)
4. **OTP Verification** (04_onboarding_screen_5.jpg)
5. **Home/Dashboard** (21_home_screen_1.jpg)
6. **Quiz Playing** (33_quiz_screen_1.jpg)
7. **Quiz Results** (36_quiz_results_screen_1.jpg)

### HIGH PRIORITY (Core experience)
8. Onboarding screens (04_01-03)
9. Sign In/Sign Up (11-16)
10. Category selection (28-30)
11. Quiz Zone (31-32)
12. Profile (44-45)
13. Leaderboard (47-48)

### MEDIUM PRIORITY (Enhanced features)
14. Search (25-27)
15. Battle Room (40-41)
16. Exam Mode (42-43)
17. Friends & Chat (49-51)
18. Challenges (52-53)
19. Bookmarks & Badges (54-56)

### LOW PRIORITY (Secondary features)
20. Rewards & Notifications (57-59)
21. Statistics (60-61)
22. Settings (62)
23. Subscription (63)
24. Performance (64)
25. Coin Store (65)
26. Referral (66)

---

## 🎯 Next Steps

### Immediate Actions
1. Create reusable component library
   - IbeereButton (all variants)
   - IbeereTextField (with validation)
   - IbeereCard (with decorative shapes)
   - IbeereDecorativeBackground
   - IbeereLogo component

2. Implement critical path screens
   - Start with splash
   - Move to phone login
   - Implement OTP
   - Create home screen

3. Test on physical device
   - Verify pixel-perfect matching
   - Check animations
   - Test all interactions

4. Iterate based on client feedback
   - Adjust colors if needed
   - Fine-tune spacing
   - Perfect animations

---

## 📊 Progress Tracking

**Completion**: 1/66 screens (1.5%)
- ✅ Design system analyzed
- ⏳ 65 screens remaining

**Estimated Time**: 
- Critical path (7 screens): 2-3 days
- High priority (13 screens): 1 week
- Medium priority (16 screens): 1 week
- Low priority (30 screens): 1-2 weeks

**Total**: 3-4 weeks for complete pixel-perfect implementation

---

*Last Updated: December 15, 2025*  
*Status: Phase 2 In Progress*
