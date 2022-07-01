\version "2.22.1"
#(set-global-staff-size 17)
\include "poly-mark-engraver.ly"
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Libertango"
composer = #"Astor Piazzolla"
meter = #"(Med. Tango)"
kwtempo = #"Medium"
kwstyle = #"Tango"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { a1*2:m b:7/a d:m6/a a:m a:m7/g fis:dim7 f:dim7 e:7 }
  g1:m a:9- d:m s f:m6 g:7 c e:7  a1*2:m b:7/a d:m6/a a:m
  a1*2:m b:7/a d:m6/a a:m a1:m a:m6.9
}



theNotes =  \relative c' {
  \clef "treble" \key c \major \time 4/4
  r8 _"tacet 1st X" e f e f e c'8 a | % 18
  r8 e f e c' a e8 f | % 19
  r8 dis e dis e dis b'8 fis |
  r8 dis e dis b' fis dis8 e | % 21
  r8 d e d e d b' f8 | % 22
  r8 d e d b' f d8 e | % 23
  r8 c d c d c a' e8 | % 24
  r8 c d c a' e c d8 | % 25
  r8 c d c d c a' e8 | % 26
  r8 c d c a' e c d8 | % 27
  r8 c d c d c a' es8 | % 28
  r8 c d c a' es c8 d | % 29
  r8 b c b c b gis'8 d |
  r8 b c b gis' d b8 c | % 31
  r8 b c b c b gis'8 d | % 32
  r8 b c b gis' d b8 c
  e'1 ~ | % 34
  e4. e,8 d'8. c16 ~ c8 b16 a | % 35
  b1 ~ | % 36
  b2.. c16 cis | % 37
  d1 ~ | % 38
  d4. e,8 c'8. b16 ~ b8 a16 gis | % 39
  a1 ~ |
  a2 ~ a4 a8 b | % 41
  c1 ~ | % 42
  c4. a8 c b c a8 | % 43
  b1 ~ | % 44
  b2 ~ b4 r | % 45
  b16 a b8 ~ b2. ~ | % 46
  b2 ~ b8 c4 b16 a | % 47
  b1 ~ | % 48
  b2 r4 e, | % 49
  bes'4. bes8 ~ bes4 e, |
  a4. a8 ~ a g f e8 | % 51
  d4. a'8 ~ a4 a | % 52
  d,4. d8 ~ d e f g8 | % 53
  as4. as8 ~ as4 d, | % 54
  g4. g8 ~ g f e d8 | % 55
  c4. g'8 ~ g4 c | % 56
  b4. e,8 r4 \times 2/3 { r8 b' a } | % 57
  e8 a b e, a c8 e, a | % 58
  d8 c4 a8 d16 c b4 a8 | % 59
  b1 ~ |
  b2 r4. b16 a | % 61
  d,8 f a d, f a8 d, f | % 62
  c'8 d, gis d' c16 b16 a4 gis8 | % 63
  a1 ~ | % 64
  a2 r
  \repeat volta 2 {
    r8 e f8 e f e c' a8 | % 66
    r8 e f e c' a e8 f | % 67
    r8 dis e dis e dis b'8 fis | % 68
    r8 dis e dis b' fis8 dis e | % 69
    r8 d e d e d b'8 f |
    r8 d e d b' f d8 e | % 71
    r8 c d c d c a'8 e
  }
  \alternative { { r8 c d c a' e c8 d } { r8 c d c a' e c8 d ~ } } | % 74
  d1 \bar ".."
}

Basse = \relative c' {
  \clef "bass" \time 4/4 \key c \major
  \override TextSpanner.bound-details.left.text = "Tacet 1st X"
  a4. \startTextSpan a8 ~ a4 c8 e, | % 18
  a4. a8 ~ a4 c8 e, | % 19
  a4. a8 ~ a4 fis8 dis |
  a'4. a8 ~ a4 fis8 dis | % 21
  a'4. a8 ~ a4 f8 d | % 22
  a'4. a8 ~ a4 f8 d | % 23
  a'4. a8 ~ a4 c8 e, | % 24
  a4. a8 ~ a4 c8 e, \stopTextSpan | % 25
  g4. _"Bass starts here the 1st X" g8 ~ g4 a8 e | % 26
  g4. g8 ~ g4 a8 e | % 27
  fis4. fis8 ~ fis4 a8 dis, | % 28
  fis4. fis8 ~ fis4 a8 dis, | % 29
  f4. f8 ~ f4 gis8 d |
  f4. f8 ~ f4 gis8 d | % 31
  e4. b'8 ~ b4 e | % 32
  b4. e,8 ~ e4 e
  a4. a8 ~ a4 c8 e, | % 34
  a4. a8 ~ a4 c8 e, | % 35
  a4. a8 ~ a4 fis8 dis | % 36
  a'4. a8 ~ a4 fis8 dis | % 37
  a'4. a8 ~ a4 f8 d | % 38
  a'4. a8 ~ a4 f8 d | % 39
  a'4. a8 ~ a4 c8 e, |
  a4. a8 ~ a4 c8 e, | % 41
  g4. g8 ~ g4 a8 e | % 42
  g4. g8 ~ g4 a8 e | % 43
  fis4. fis8 ~ fis4 a8 dis, | % 44
  fis4. fis8 ~ fis4 a8 dis, | % 45
  f4. f8 ~ f4 gis8 d | % 46
  f4. f8 ~ f4 gis8 d | % 47
  e4. b'8 ~ b4 e | % 48
  b4. e,8 ~ e4 e8 f | % 49
  g1 |
  a,4. e'8 a g f e | % 51
  d1 ~ | % 52
  d2 r8 cis d e | % 53
  f1 | % 54
  g4. e8 g f e8 d | % 55
  c1 | % 56
  e4. e'8 ~ e e, fis gis8 | % 57
  a4. a8 ~ a4 a | % 58
  a4. a8 ~ a4 a | % 59
  a4. a8 ~ a4 a |
  a4. a8 ~ a4 a | % 61
  a4. a8 ~ a4 a | % 62
  a4. a8 ~ a4 a | % 63
  a4. a8 ~ a4 a | % 64
  a4. a8 ~ a4 a
  \repeat volta 2 {
    a4. a8 ~ a4 a | % 66
    a4. a8 ~ a4 a | % 67
    a4. a8 ~ a4 a | % 68
    a4. a8 ~ a4 a | % 69
    a4. a8 ~ a4 a |
    a4. a8 ~ a4 a | % 71
    a4. a8 ~ a4 a
  }
  \alternative { { a4. a8 ~ a4 a } { a4. a8 ~ a4 a8 a ~ } } | % 74
  a1 \bar ".."
}

PianoRH = \relative c' {
  \clef "treble" \time 4/4 \key c \major | % 1
  a8 e' c' a, e' c'8 a, c' | % 18
  a,8 e' c' a, e' c'8 a, c' | % 19
  a,8 fis' b a, fis' b8 a, b' |
  a,8 fis' b a, fis' b8 a, b' | % 21
  a,8 f' b a, f' b8 a, b' | % 22
  a,8 f' b a, f' b8 a, b' | % 23
  a,8 e' a a, e' a a,8 a' | % 24
  a,8 e' a a, e' a a,8 a' | % 25
  g,8 e' a g, e' a8 g, a' | % 26
  g,8 e' a g, e' a8 g, a' | % 27
  fis,8 dis' a' fis, dis' a'8 fis, a' | % 28
  fis,8 dis' a' fis, dis' a'8 fis, a' | % 29
  f,8 d' gis f, d' gis8 f, gis' |
  f,8 d' gis f, d' gis8 f, gis' | % 31
  e,8 d' gis e, d' gis e,8 gis' | % 32
  e,8 d' gis e, d' gis e,8 gis'
  r8 e f e f e c'8 a | % 34
  r8 e f e c' a e8 f | % 35
  r8 dis e dis e dis b'8 fis | % 36
  r8 dis e dis b' fis dis8 e | % 37
  r8 d e d e d b' f8 | % 38
  r8 d e d b' f d8 e | % 39
  r8 c d c d c a'8 e |
  r8 c d c a' e c8 d | % 41
  r8 c d c d c a'8 e | % 42
  r8 c d c a' e d8 c | % 43
  r8 c d c d c a'8 es | % 44
  r8 c d c a' es c8 d | % 45
  r8 b c b c b gis'8 d | % 46
  r8 b c b gis' d b8 c | % 47
  r8 b c b c b gis'8 d | % 48
  r8 b c b gis' d b8 c | % 49
  r4 a' ~ a bes | cis16 b cis8 ~ cis4 ~ cis4 e | % 51
  f4 d ~ d4. a16 g | % 52
  a2 r8 cis d e | % 53
  f16 e f4. ~ f fis,16 g | % 54
  as8 g f g g' f8 e d | % 55
  e4. \times 2/3 { f16 e d } e4. \times 2/3 { f16 e d } | % 56
  e4. \times 2/3 { f16 e d } e4. \times 2/3 { f16 e d } | % 57
  <e, b'>4. <e b'>8 ~ <e b'>4 <e b'> | % 58
  <e b'>4. <e b'>8 ~ <e b'>4 <e b'> | % 59
  <dis fis b>4. <dis fis b>8 ~ <dis fis b>4 <dis fis b>4 |
  <dis fis b>4. <dis fis b>8 ~ <dis fis b>4 <dis fis b>4 | % 61
  <d f a>4. <d f a>8 ~ <d f a>4 <d f a>4 | % 62
  <d f a>4. <d f a>8 ~ <d f a>4 <d f a>4 | % 63
  <c e a>4. <c e a>8 ~ <c e a>4 <c e a>4 | % 64
  <c e a>4. <c e a>8 ~ <c e a>4 <c e a>4 |
  \repeat volta 2 {
    r8 e f e f e8 c' a | % 66
    r8 e f e c' a8 e f | % 67
    r8 dis e dis e dis8 b' fis | % 68
    r8 dis e dis b' fis8 dis e | % 69
    r8 d e d e d8 b' f |
    r8 d e d b' f8 d e | % 71
    r8 c d c d c8 a' e
  }
  \alternative { { r8 c d c a' e8 c d } { r8 c d c a'4 r8 <e g b>8 ~ } } | % 74
  <e g b>1 \bar ".."
}

PianoLH = \relative c {
  \clef "bass" \time 4/4 \key c \major | % 1
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 18
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 19
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 |
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 21
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 22
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 23
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 24
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 25
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 26
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 27
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 28
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 29
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 |
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 | % 31
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 | % 32
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 34
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 35
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 36
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 37
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 38
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 39
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 |
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 41
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 42
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 43
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 44
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 45
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 46
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 47
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 48
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 49
  r8 g' a g d' bes8 g a |
  r8 g a g cis bes8 g a | % 51
  r8 a bes a bes a8 f' d | % 52
  r8 a bes a f' d8 a bes | % 53
  r8 f g f c' as8 f g | % 54
  r8 f g f b g8 f g | % 55
  <g, c e>4 <c e g> <c e g> <c e g>4 | % 56
  <b d e gis>4 <b d e gis> <b d e gis> <b d e gis>4 | % 57
  r8 e f e f e8 c' a | % 58
  r8 e f e c' a8 e f | % 59
  r8 dis e dis e dis8 b' fis |
  r8 dis e dis b' fis8 dis e | % 61
  r8 d e d e d b'8 f | % 62
  r8 d e d b' f d8 e | % 63
  r8 c d c d c8 a' e | % 64
  r8 c d c a' e8 c d
  \repeat volta 2 {
    <c e>4. <c e>8 ~ <c e>4 <c e>4 | % 66
    <c e>4. <c e>8 ~ <c e>4 <c e>4 | % 67
    <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 68
    <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 69
    <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 |
    <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 71
    <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4
  }
  \alternative {
    { <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 }
    { <a c e>4. <a c e>8 ~ <a c e>4 <a c e>8 <a c e> ~ }
  } | % 74
  <a c e>1 \bar ".."
}

GuitarI = \relative c' {
  \clef "treble_8" \time 4/4 \key c \major | % 1
  a8 e' c' a, e' c'8 a, c' | % 18
  a,8 e' c' a, e' c'8 a, c' | % 19
  a,8 fis' b a, fis' b8 a, b' |
  a,8 fis' b a, fis' b8 a, b' | % 21
  a,8 f' b a, f' b8 a, b' | % 22
  a,8 f' b a, f' b8 a, b' | % 23
  a,8 e' a a, e' a a,8 a' | % 24
  a,8 e' a a, e' a a,8 a' | % 25
  g,8 e' a g, e' a8 g, a' | % 26
  g,8 e' a g, e' a8 g, a' | % 27
  fis,8 dis' a' fis, dis' a'8 fis, a' | % 28
  fis,8 dis' a' fis, dis' a'8 fis, a' | % 29
  f,8 d' gis f, d' gis8 f, gis' |
  f,8 d' gis f, d' gis8 f, gis' | % 31
  e,8 d' gis e, d' gis e,8 gis' | % 32
  e,8 d' gis e, d' gis e,8 gis'
  r8 e f e f e c'8 a | % 34
  r8 e f e c' a e8 f | % 35
  r8 dis e dis e dis b'8 fis | % 36
  r8 dis e dis b' fis dis8 e | % 37
  r8 d e d e d b' f8 | % 38
  r8 d e d b' f d8 e | % 39
  r8 c d c d c a'8 e |
  r8 c d c a' e c8 d | % 41
  r8 c d c d c a'8 e | % 42
  r8 c d c a' e d8 c | % 43
  r8 c d c d c a'8 es | % 44
  r8 c d c a' es c8 d | % 45
  r8 b c b c b gis'8 d | % 46
  r8 b c b gis' d b8 c | % 47
  r8 b c b c b gis'8 d | % 48
  r8 b c b gis' d b8 c | % 49
  r4 a ~ a bes | cis16 b cis8 ~ cis4 ~ cis4 e | % 51
  f4 d ~ d4. a16 g | % 52
  a2 r8 cis d e | % 53
  f16 e f4. ~ f fis,16 g | % 54
  as8 g f g g' f8 e d | % 55
  e4. \times 2/3 { f16 e d } e4. \times 2/3 { f16 e d } | % 56
  e4. \times 2/3 { f16 e d } e4. \times 2/3 { f16 e d } | % 57
  <e, b'>4. <e b'>8 ~ <e b'>4 <e b'> | % 58
  <e b'>4. <e b'>8 ~ <e b'>4 <e b'> | % 59
  <dis fis b>4. <dis fis b>8 ~ <dis fis b>4 <dis fis b>4 |
  <dis fis b>4. <dis fis b>8 ~ <dis fis b>4 <dis fis b>4 | % 61
  <d f a>4. <d f a>8 ~ <d f a>4 <d f a>4 | % 62
  <d f a>4. <d f a>8 ~ <d f a>4 <d f a>4 | % 63
  <c e a>4. <c e a>8 ~ <c e a>4 <c e a>4 | % 64
  <c e a>4. <c e a>8 ~ <c e a>4 <c e a>4 |
  \repeat volta 2 {
    r8 e' f e f e8 c' a | % 66
    r8 e f e c' a8 e f | % 67
    r8 dis e dis e dis8 b' fis | % 68
    r8 dis e dis b' fis8 dis e | % 69
    r8 d e d e d8 b' f |
    r8 d e d b' f8 d e | % 71
    r8 c d c d c8 a' e
  }
  \alternative { { r8 c d c a' e8 c d } { r8 c d c a'4 r8 <e g b>8 ~ } } | % 74
  <e g b>1 \bar ".."
}

GuitarII = \relative c' {
  \clef "treble_8" \time 4/4 \key c \major | % 1
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 18
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 19
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 |
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 21
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 22
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 23
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 24
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 25
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 26
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 27
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 28
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 29
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 |
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 | % 31
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4 | % 32
  <gis b d>4. <gis b d>8 ~ <gis b d>4 <gis b d>4
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 34
  <c e>4. <c e>8 ~ <c e>4 <c e> | % 35
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 36
  <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 37
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 38
  <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 39
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 |
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 41
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 42
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 43
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 44
  <a c es>4. <a c es>8 ~ <a c es>4 <a c es>4 | % 45
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 46
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 47
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 48
  <fis b d>4. <fis b d>8 ~ <fis b d>4 <fis b d>4 | % 49
  r8 g' a g d' bes8 g a |
  r8 g a g cis bes8 g a | % 51
  r8 a bes a bes a8 f' d | % 52
  r8 a bes a f' d8 a bes | % 53
  r8 f g f c' as8 f g | % 54
  r8 f g f b g8 f g | % 55
  <g, c e>4 <c e g> <c e g> <c e g>4 | % 56
  <b d e gis>4 <b d e gis> <b d e gis> <b d e gis>4 | % 57
  r8 e f e f e8 c' a | % 58
  r8 e f e c' a8 e f | % 59
  r8 dis e dis e dis8 b' fis |
  r8 dis e dis b' fis8 dis e | % 61
  r8 d e d e d b'8 f | % 62
  r8 d e d b' f d8 e | % 63
  r8 c d c d c8 a' e | % 64
  r8 c d c a' e8 c d
  \repeat volta 2 {
    <c e>4. <c e>8 ~ <c e>4 <c e>4 | % 66
    <c e>4. <c e>8 ~ <c e>4 <c e>4 | % 67
    <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 68
    <b dis fis>4. <b dis fis>8 ~ <b dis fis>4 <b dis fis>4 | % 69
    <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 |
    <b d f>4. <b d f>8 ~ <b d f>4 <b d f>4 | % 71
    <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4
  }
  \alternative {
    { <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 }
    { <a c e>4. <a c e>8 ~ <a c e>4 <a c e>8 <a c e> ~ }
  } | % 74
  <a c e>1 \bar ".."
}

ossature = {
  \bar "[|:" \mark #1
  \repeat volta 2 { \repeat unfold 4 { s1*4 \break } }
  \mark \markup {  \raise #1 \with-color #red \bold \larger \musicglyph "scripts.varsegno" \box B }
  \repeat unfold 4 { s1*4 \break }
  \mark #3
  \repeat unfold 4 { s1*4 \break } \bar "||-[|:"
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup  { "Solos on" \box B \box C \with-color #red "Then D.S. al coda" }
  \doublePolyMark #'RightUp
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  s1*4 \break
  %coda

}


grille = \chordmode {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box A & \box B }
  \bar "[|:"
  \repeat volta 2 {
    \repeat percent 2 { a1:m } \repeat percent 2 { b:7/a }  \break
    \repeat percent 2 { d:m6/a } \repeat percent 2 { a:m } \break
    \repeat percent 2 { a:m7/g } \repeat percent 2 { fis:dim7 } \break
    \repeat percent 2 { f:dim7 } \repeat percent 2 { e:7 } \break
  }
  \mark #3
  g1:m a:9- \repeat percent 2 { d:m } \break
  f:m6 g:7 c e:7  \break
  \repeat percent 2 { a1:m } \repeat percent 2 { b:7/a } \break
  \repeat percent 2 { d:m6/a } \repeat percent 2 { a:m } \break
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda" \bar "||-[|:"
  \repeat volta 2 {
    \repeat percent 2 { a1:m } \repeat percent 2 { b:7/a } \break
    \repeat percent 2 { d:m6/a } \repeat percent 2 { a:m } \break
  }
  a:m6.9 \bar ".." \stopStaff s1 \bar ""  s1 \bar ""  s1 \bar ""
  \label #'theLastPage
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    page-count = #2
    ragged-last-bottom = ##f
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          { \theNotes  \label #'theLastPage }
        >>
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    page-count = #2
    ragged-last-bottom = ##f
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          { \transpose c d \theNotes \label #'theLastPage }
        >>
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    page-count = #2
    ragged-last-bottom = ##f
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          { \transpose c a \theNotes \label #'theLastPage }
        >>
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
       >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }


\book {
  \paper { #(set-paper-size "a4")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "Da4")
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames \harmonies
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } { \theNotes \label #'theLastPage }
          \new PianoStaff \with { instrumentName = "Piano" } <<
            \new Staff \PianoRH
            \new Staff\PianoLH
          >>
          \new Staff \with { instrumentName = "Basse" } \Basse
      >> >>
} } }

\book {
  \paper { #(set-paper-size "a5landscape")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "DTab")
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames \harmonies
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } { \theNotes \label #'theLastPage }
          \new PianoStaff \with { instrumentName = "Piano" } <<
            \new Staff \PianoRH
            \new Staff \PianoLH
          >>
          \new Staff \with { instrumentName = "Basse" } \Basse
      >> >>
} } }

\book {
  \paper { #(set-paper-size "a4")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "Pianoa4")
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames \harmonies
        \new PianoStaff \with { instrumentName = "Piano" } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper { #(set-paper-size "a5landscape")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "PianoTab")
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames \harmonies
        \new PianoStaff \with { instrumentName = "Piano" } <<
          { \new Staff \PianoRH \label #'theLastPage }
          \new Staff  \PianoLH
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa }  \Basse
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    page-count = #2
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa }  { \Basse \label #'theLastPage }
      >>
} } }

\book {
  \paper { #(set-paper-size "a4")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "Guitara4")
    \score {
      <<
        \new Devnull \ossature
        \new StaffGroup <<
           \new Staff \with { instrumentName = "Guitar I" } \GuitarI
        \new ChordNames \harmonies
         \new Staff \with { instrumentName = "Guitar II" } \GuitarII
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper { #(set-paper-size "a5landscape")
           print-first-page-number = ##t
  }
  \bookpart {
    #(define output-suffix "GuitarTab")
    \score {
      <<
        \new Devnull \ossature
        \new StaffGroup <<
           \new Staff \with { instrumentName = "Guitar I" } \GuitarI
        \new ChordNames \harmonies
         \new Staff \with { instrumentName = "Guitar II" } { \GuitarII \label #'theLastPage }
      >> >>
} } }