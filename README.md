# Elm CV App

A professional CV/portfolio application built with Elm, showcasing Elm development patterns, architecture, and best practices.

## Overview

This is a fully-functional CV application that demonstrates:

- **Clean Architecture**: Separation of concerns with Atoms, Molecules, Organisms, and Pages
- **Type Safety**: Leveraging Elm's type system to prevent runtime errors
- **The Elm Architecture**: Proper Model-View-Update pattern
- **elm-css**: Styling with type-safe CSS
- **Browser Navigation**: Client-side routing using Elm's URL parsing
- **Responsive Design**: Mobile-friendly layouts
- **Component Composition**: Reusable, composable components from bottom-up

## Project Structure

```
src/
├── Main.elm              # Application entry point
├── Route.elm             # URL routing configuration
├── Types.elm             # Shared type definitions
├── Theme.elm             # Color theme and spacing
├── Data/
│   └── CvData.elm        # Sample CV data
├── Atom/                 # Basic building blocks
│   ├── Button.elm        # Reusable button component
│   ├── Heading.elm       # h1, h2, h3 components
│   ├── Link.elm          # Link component
│   └── Text.elm          # Text components
├── Molecule/             # Combinations of atoms
│   ├── Badge.elm         # Technology/skill badges
│   ├── Card.elm          # Card container
│   ├── ExperienceCard.elm# Work experience card
│   ├── ProjectCard.elm   # Project card
│   └── SkillGroup.elm    # Skill group display
├── Organism/             # Page sections
│   ├── Header.elm        # Page header
│   ├── Footer.elm        # Page footer
│   └── Navigation.elm    # Navigation bar
├── Page/                 # Full pages
│   ├── Home.elm          # Home page
│   ├── Experience.elm    # Experience page
│   ├── NotFound.elm      # 404 page
│   ├── Projects.elm      # Projects page
│   └── Skills.elm        # Skills page
└── Util/
    └── Css.elm           # CSS utility functions
```

## Architecture Patterns

### Component Structure

Components follow a consistent pattern with:

- **Builder Pattern**: For configurable components (e.g., Button)
- **Exposure Lists**: Explicit module exports
- **Styling Functions**: Type-safe CSS composition

Example:

```elm
module Atom.Button exposing (ColorVariant(..), new, view, withColorVariant)

type ColorVariant
    = Primary
    | Secondary
    | Minimal

type alias Button msg =
    { label : String
    , onClick : msg
    , colorVariant : ColorVariant
    , isDisabled : Bool
    }

new : String -> msg -> Button msg
withColorVariant : ColorVariant -> Button msg -> Button msg
view : Button msg -> Html msg
```

### Styling with elm-css

All styling is type-safe using `elm-css`:

- Centralized colors and spacing in `Theme.elm`
- CSS utility functions in `Util.Css`
- Component styles defined inline with type safety

### Pages and Routing

- Client-side routing with `Route.elm`
- Each page is a separate module with a `view` function
- Navigation updates the URL without page reloads

## Key Features

✨ **Type-Safe Development**: Elm's type system prevents entire categories of bugs
✨ **Performance**: Minimal bundle size, fast rendering
✨ **Maintainability**: Clear component hierarchy and responsibilities
✨ **Accessibility**: Semantic HTML and proper focus management
✨ **Responsive**: Works on all screen sizes
✨ **No Runtime Errors**: Elm's compiler catches issues before runtime

## Development

### Setup

```bash
# Install dependencies
pnpm install

# Start development server
pnpm dev
```

The app will be available at `http://localhost:3001`

### Build

```bash
pnpm build
```

Output will be in the `build/` directory.

## Technology Stack

- **Language**: Elm 0.19.1
- **Styling**: elm-css
- **Routing**: Browser Navigation
- **Build Tool**: Vite
- **Package Manager**: pnpm

## Customization

### Update Your Information

Edit `src/Data/CvData.elm` to add your:

- Name, title, and summary
- Work experience
- Projects
- Skills
- Contact information

### Theme

Customize colors and spacing in `src/Theme.elm`:

```elm
stringColor : StringColor
stringColor =
    { primary = "#1e40af"
    , secondary = "#7c3aed"
    , ... more colors
    }

spacing : Spacing
spacing =
    { xs = 4
    , sm = 8
    , md = 16
    , ... more sizes
    }
```

## Learning Resources

This project demonstrates:

- Elm Architecture (Model-View-Update)
- Component composition and reusability
- Type-safe styling with elm-css
- Browser routing and navigation
- Functional programming patterns
- Immutability and pure functions

## License

This project is open source and available for reference and customization.

---

**Built with ❤️ in Elm**
