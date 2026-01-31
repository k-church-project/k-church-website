---
parent: "[[(main)(website) k-church-project]]"
---
# Directive: Build Church Website

## Goal
Build a 5-page static website for a church based on provided content and design references.

## Inputs
- Content: `./docs/RM Website.pdf`
- Images content: `./docs/RM_Website/`
- Design Reference: [maucariapacom-church-starter](https://maucariapacom-church-starter.pages.dev/)
- Icons/Images: Extract from PDF or use generated assets.

## Required Pages
1. HOME (Главная)
2. ABOUT US (О НАС)
3. MINISTRIES (СЛУЖЕНИЯ)
4. CONTACT (КОНТАКТЫ) - *Inferred to reach 5*
5. EVENTS/NEWS (СОБЫТИЯ) - *Inferred to reach 5*

## Execution Tools
- Complete: Extracted content using `view_file` OCR.
- Complete: Generated assets using `generate_image`.
- Complete: Built static site in `./html/`.

## Outputs
- Static HTML files in `./html/` (`index.html`, `about.html`, `ministries.html`, `announcements.html`, `contact.html`).
- Images in `./html/images/` (`hero.png`, `pastor.png`, `sunday-school.png`, `youth.png`, `home-cell.png`).
- Styles in `./html/index.css`.

## Status: COMPLETE
- Website built with modern, clean CSS and premium generated assets.
- Navigation verified (logic-wise).
- Optimized for SEO and mobile responsiveness.

