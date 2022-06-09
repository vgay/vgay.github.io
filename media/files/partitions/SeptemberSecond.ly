\version "2.22.1"
#(set-global-staff-size 18)
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
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 15)
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

title = #"September Second"
composer = #"Michel Petrucciani"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"

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
  asplayed = #"Michel Petrucciani" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=Pqzr4AZB7tY"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  %meter = \markup { \small  { \tiny \raise #0.4 \note {4} #1 } "= 160""Half Time Feel" }
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
    \override MultiMeasureRest #'expand-limit = #2
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


structure = {
  \mark \markup \box Intro
  \repeat volta 2 { s1*3 } \alternative { { s1 } { s1 } }
  \bar "||" \break \mark \markup \box A
  s1*4 \break  \mark \markup {  \with-color #red \bold \larger \musicglyph "scripts.varsegno" }
  \acciaccatura s8 s1*4 \bar "||" \break \mark \markup \box B
  s1*4 \break  s1*4 \break  s1*4 \break  \bar "||" \break \mark \markup \box C
  s1*3 \break  s1*3 \break  s1*3 \break \bar "||" \mark \markup \box D
  s1*4 \break  s1*4 \bar "||" \break \mark \markup \box E s1*4 \break s1*4  \bar ".."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \right-column {
    \concat { "Solos on " \box A \box B \box C \box D \box E }
    \concat { "After solos Play " \box E " then D.S." }
    \concat { "Repeat and fade on " \box E }
  }
  \label #'theLastPage
}


theNotes = \relative c' {
  \clef "treble"\time 4/4 \key c \major
  R1*3  R1
  \times 2/3 { r8 r e } \times 2/3 { f8 g as } \times 2/3 { b8 c d } \times 2/3 { e8 f g }
  e1 ~ | % 7
  e2 d4 -- g -- | % 8
  c,1 ~ | % 9
  c4. b8 ~ \times 2/3 { b4 c d }
  \acciaccatura { d8 } e1 ~ | % 11
  e1 ~ | % 12
  e2. r4 | % 13
  dis4. e8 ~ e4 fis
  gis1 | % 15
  cis8 b r gis r e r dis8 ~ | % 16
  dis1 | % 17
  r4. d8 ~ \times 2/3 { d4 b g }  % 18
  f4. es8 ~ es2 ~ | % 19
  es4. cis'8 ~ \times 2/3 { cis4 a f } |
  es4. des8 ~ des2 ~ | % 21
  des4. b'8 ~ \times 2/3 { b4 g dis } |  % 22
  cis2.. b8 ~ | % 23
  b2 ~ b8 b \times 2/3 { cis8 dis cis ~ } | % 24
  cis1 |  % 25
  r8 b' ais b ais4 gis8 g ~ | % 26
  g4. d'8 ~ d2 ~ | % 27
  d1
  R1 | % 29
  r4. b8 ~ \times 2/3 { b4 c d } |
  \acciaccatura { d8 } e1 ~ | % 31
  e2 ~ e8 d g e8 ~ |  % 32
  e1 | % 33
  R1*2
  \comp #32
  e1 ~ | % 44
  e8 es d c \times 2/3 { a4 e d ~ } | % 45
  d1 | % 46
  \times 2/3 { r8 r e } \times 2/3 { f8 g as } \times 2/3 { b8 c d } \times 2/3 { e8 f g }|  % 47
  e1 ~ | % 48
  e2 d4 g | % 49
  c,1 ~ |
  c4. \startParenthesis \parenthesize b8 ^\markup "only before D.S." ~ \times 2/3 { b4 c \endParenthesis \parenthesize  d }
}


alto = \relative c' {
  \clef "treble"\time 4/4 \key c \major
  R1*3  R1
  \times 2/3 { r8 r e } \times 2/3 { f8 g as } \times 2/3 { b8 c d } \times 2/3 { e8 f g }
  e1 ~ | % 7
  e2 d4 -- g -- | % 8
  c,1 ~ | % 9
  c4. b8 ~ \times 2/3 { b4 c d }
  \acciaccatura { d8 } e1 ~ | % 11
  e1 ~ | % 12
  e2. r4 | % 13
  es4. fes8 ~ fes4 ges
  as1 | % 15
  des8 b r as r fes r es8 ~ | % 16
  es1 | % 17
  r4. d'?8 ~ \times 2/3 { d4 b g }  % 18
  f4. es8 ~ es2 ~ | % 19
  es4. cis'8 ~ \times 2/3 { cis4 a f } |
  es4. des8 ~ des2 ~ | % 21
  des4. b'8 ~ \times 2/3 { b4 g es } |  % 22
  cis2.. b8 ~ | % 23
  b2 ~ b8 b \times 2/3 { des8 es des ~ } | % 24
  des1 |  % 25
  r8 b bes b bes4 as8 g ~ | % 26
  g4. d'?8 ~ d2 ~ | % 27
  d1
  R1 | % 29
  r4. b8 ~ \times 2/3 { b4 c d } |
  \acciaccatura { d8 } e1 ~ | % 31
  e2 ~ e8 d g e8 ~ |  % 32
  e1 | % 33
  R1*2
  R1*8
  e1 ~ | % 44
  e8 es d c \times 2/3 { a4 e d ~ } | % 45
  d1 | % 46
  \times 2/3 { r8 r e } \times 2/3 { f8 g as } \times 2/3 { b8 c d } \times 2/3 { e8 f g }|  % 47
  e1 ~ | % 48
  e2 d4 g | % 49
  c,1 ~ |
  c4. \startParenthesis \parenthesize b8 ^\markup "only before D.S." ~ \times 2/3 { b4 c \endParenthesis \parenthesize  d }
}


Guitar = \relative c {
  \time 4/4 \key c \major | % 1
  a4 e'8 c' ~ c e,4 g,8 ~ | % 2
  g8 d'4 b'8 ~ b d,4 g,8 | % 3
  f4 c'8 a' ~ a c,4 g8 ~
  g8 d'4 b'8 ~ b d,4 g,8
  R1
  a4 e'8 c' ~ c e,4 g,8 ~ | % 7
  g8 d'4 b'8 ~ b d,4 g,8 | % 8
  f4 c'8 a' ~ a c,4 g8 ~ | % 9
  g8 d'4 b'8 ~ b d,4 g,8 |
  \acciaccatura s8 a4 e'8 c' ~ c e,4 g,8 ~ | % 11
  g8 d'4 b'8 ~ b d,4 g,8 | % 12
  f4 c'8 a' ~ a c,4 r8 | % 13
  <a' dis fis>4. q8 ~ q8 q4.
  <fis b dis gis>4. q8 r q4 <fis b e a>8 ~ | % 15
  q4. q8 ~ q2 | % 16
  <fis b dis gis>4. q8 q4. <f b d as'>8 ~ | % 17
  q4. q8 ~ q8 q4. | % 18
  <es bes' d g>8 r4 q8 r q r8 <es a des f> | % 19
  r8 q r4 q r |
  <f as des f>8 r4 q8 r q r <b des g>8 | % 21
  r8 q r4 q r | % 22
  r4 <bes des as'>8 q q q4 <b des g>8 ~ | % 23
  q4. q8 ~ q2 | % 24
  <bes des ges>4. q8 ~ q q4 <b des f>8 ~ | % 25
  q1 | % 26
  <bes es g>2 ~ q8 q4 q8 ~ | % 27
  q4. q8 ~ q2
  a,4 e'8 c' ~ c e,4 g,8 ~ | % 29
  g8 d'4 b'8 ~ b d,4 g,8 |
  f4 c'8 a' ~ a c,4 g8 ~ | % 31
  g8 d'4 b'8 ~ b d,4 g,8 | % 32
  a4. <cis gis' b e gis>8 ~ q2 | % 33
  <a e' a cis e>2 <as es' as c f as> | % 34
  <a fis cis' e a>2 <c f c' es as>
  <es as es' f>4 q q8 q4 q8 ~ | % 36
  q8 q4 q8 q4 q4 | % 37
  <d g d' e>4 q q8 q4 q8 ~ | % 38
  q8 q4 q8 q4 q | % 39
  <d a' b f'>4 q q8 q4 q8 ~ |
  q8 q4 q8 q4 q | % 41
  <c e g b e>4 q q8 q4 <b e gis b e>8 ~ | % 42
  q8 q4 q8 ~ q2
  a4 e'8 c' ~ c e,4 g,8 ~ | % 44
  g8 d'4 b'8 ~ b d,4 g,8 | % 45
  f4 c'8 a' ~ a c,4 g8 ~ | % 46
  g8 d'4 b'8 ~ b d,4 g,8 | % 47
  a4 e'8 c' ~ c e,4 g,8 ~ | % 48
  g8 d'4 b'8 ~ b d,4 g,8 | % 49
  f4 c'8 a' ~ a c,4 g8 ~ |
  g8 d'4 b'8 ~ b2
}

Piano = \relative c {
  \time 4/4 \key c \major | % 1
  a4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 g8 ~
  g8 d'4 <a' b>8 ~ b d,4 g,8
  R1
  a4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 g8 ~
  g8 d'4 <a' b>8 ~ b d,4 g,8
  \acciaccatura s8
  a4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 r8
  <a' dis fis>4. q8 ~ q8 q4.
  <gis b dis fis>4. q8 r q4 <a b e>8 ~ | % 15
  q4. q8 ~ q2 | % 16
  <gis b dis fis>4. q8 q4. <as b d f>8 ~ | % 17
  q4. q8 ~ q8 q4. | % 18
  <g bes d>8 r4 q8 r q r8 <es a des> | % 19
  r8 q r4 q r |
  <f as c>8 r4 q8 r q r <des g b>8 | % 21
  r8 q r4 q r | % 22
  r4 <gis bes>8 q q q4 <g b>8 ~ | % 23
  q4. q8 ~ q2 | % 24
  <fis ais>4. q8 ~ q q4 <f b>8 ~ | % 25
  q1 | % 26
  <g bes>2 ~ q8 q4 q8 ~ | % 27
  q4. <c es>8 ~ q2
  a,4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 g8 ~
  g8 d'4 <a' b>8 ~ b d,4 g,8
  a4. <cis e gis b cis>8 ~ q2 | % 33
  <a a' cis e>2 <as as' c f a> | % 34
  <fis fis' e' a cis>2 <f f' es' as es'>
  <es' as es' f>4 q q8 q4 q8 ~ | % 36
  q8 q4 q8 q4 q4 | % 37
  <d g d' e>4 q q8 q4 q8 ~ | % 38
  q8 q4 q8 q4 q | % 39
  <d a' b f'>4 q q8 q4 q8 ~ |
  q8 q4 q8 q4 q | % 41
  <c e g b e>4 q q8 q4 <b e gis b e>8 ~ | % 42
  q8 q4 q8 ~ q2
  a4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 g8 ~
  g8 d'4 <a' b>8 ~ b d,4 g,8
  a4 e'8 < b' c> ~ q e,4 g,8 ~ | % 2
  g8 d'4 <a' b>8 ~ q d,4 g,8 | % 3
  f4 c'8 <g' a> ~ q c,4 g8 ~
  g8 d'4 b'8 ~ b2
}


Basse = \relative c {
  \clef "bass" \time 4/4 \key c \major
  a2.. g8 ~ | % 2
  g2.. g8 | % 3
  f2.. g8 ~ |
  g2.. g8 | % 5
  R1
  a2.. g8 ~ | % 7
  g2.. g8 | % 8
  f2.. g8 ~ | % 9
  g2.. g8 |
  \acciaccatura s8 a2.. g8 ~ | % 11
  g2.. g8 | % 12
  f2.. b8 ~ | % 13
  b4. b8 b2 e,2 e | % 15
  b'4. b8 b2 | % 16
  e,4. e8 f4 fis8 g ~ | % 17
  g1 | % 18
  c2 es4. f8 ~ | % 19
  f8 f f2. |
  bes,2 des4. dis8 ~ | % 21
  dis8 dis dis2. | % 22
  e2.. es8 ~ | % 23
  es2.. gis,8 ~ | % 24
  gis2.. g8 ~ | % 25
  g2.. c8 ~ | % 26
  c2. bes4 ~ | % 27
  bes1
  a2.. g8 ~ | % 29
  g2.. g8 |
  f2.. g8 ~ | % 31
  g1 | % 32
  a1 | % 33
  a2 as | % 34
  fis2 f f'4. as8 ~ as4. bes8 ~ | % 36
  bes4. bes8 bes2 | % 37
  e,4. g8 ~ g4. a8 ~ | % 38
  a4. a8 a2 | % 39
  d,4. a'8 ~ a4. g8 ~ |
  g4. g8 g2 | % 41
  c,8 b' a g fis
  e8 d c | % 42
  b4. b8 e2 a,2.. g8 ~ | % 44
  g2.. g8 | % 45
  f2.. g8 ~ | % 46
  g2.. g8 | % 47
  a2.. g8 ~ | % 48
  g2.. g8 | % 49
  f2.. g8 ~ |
  g1
}

harmoniesAlto = \chordmode {
  s1*5 a2..:m g8:6 s1 f2..:7+ g8:6 s1 a2..:m g8:6 s1 f1:7+ ces:7
  fes2..:7+9 ces8:7sus4 s1 fes2..:7+9 g8:9- s1
  c2..:m9 f8:5+7 s1 bes2..:m7 es8:5+7 s1
  bes2..:m5-7/e es8:5+7 s1 as2..:9sus4 g8:8 s1
  c2..:m7 c8:m7/bes s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1
  as:7+9 a2 f:m/as fis:m7 f:m7
  bes2..:7sus4/f bes8:7sus4 s1 a2..:7sus4/e a8:7sus4 s1
  g2..:9/d g8:9 s1 c2..:7+ e8:7 s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1
}

grilleAlto = \chordmode {
  \mark #1 a1:m g:6 f:7+ g:6 \break
  a1:m g:6 f:7+ ces:7 \break \mark #2 \bar "||"
  fes:7+9 ces:7sus4 fes:7+9 g:9- \break
  c:m9 f:5+7 bes:m7 es:5+7 \break
  bes:m5-7/e es:5+7 as:9sus4 g:8 \bar "||" \break \mark #3
  c:m7 c:m7/bes  a1:m  \break
  g:6 f:7+ g:6 \break
  as:7+9 a2 f:m/as fis:m7 f:m7 \bar "||" \break \mark #4
  bes1:7sus4/f bes:7sus4 a:7sus4/e a:7sus4 \break
  g:9/d g:9 c:7+ e:7 \break \mark #5
  \repeat volta 2 { a:m g:6 f:7+ g:6 }
}

harmonies = \chordmode {
  s1*5 a2..:m g8:6 s1 f2..:7+ g8:6 s1 a2..:m g8:6 s1 f1:7+ b1:7
  e2..:7+9 b8:7sus4 s1 e2..:7+9 g8:9- s1 c2..:m9 f8:5+7 s1 bes2..:m7 es8:5+7 s1
  bes2..:m5-7/e es8:5+7 s1 as2..:9sus4 g8:8 s1 c2..:m7 c8:m7/bes s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1 a:7+9 a2 f:m/as fis:m7 f:m7  bes2..:7sus4/f bes8:7sus4 s1 a2..:7sus4/e a8:7sus4 s1
  g2..:9/d g8:9 s1 c2..:7+ e8:7 s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1
  a2..:m g8:6 s1 f2..:7+ g8:6 s1
}

grille = \chordmode {
  \mark #1 a1:m g:6 f:7+ g:6 \break
  a1:m g:6 f:7+ b:7 \break \mark #2 \bar "||"
  e:7+9 b:7sus4 e:7+9 g:9- \break
  c:m9 f:5+7 bes:m7 es:5+7 \break
  bes:m5-7/e es:5+7 as:9sus4 g:8 \bar "||" \mark #3
  c:m7 c:m7/bes a1:m \break
  g:6 f:7+ g:6 \break
  as:7+9 a2 f:m/as fis:m7 f:m7 \bar "||" \break \mark #4
  bes1:7sus4/f bes:7sus4 a:7sus4/e a:7sus4 \break
  g:9/d g:9 c:7+ e:7 \break \mark #5
  \repeat volta 2 { a:m g:6 f:7+ g:6 }
}





\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    page-count = #2
    system-system-spacing = #'((basic-distance . 13)
                               (minimum-distance . 10)
                               (padding . 0))
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new Devnull \structure
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    page-count = #2
    system-system-spacing = #'((basic-distance . 13)
                               (minimum-distance . 10)
                               (padding . 0))
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new Devnull \structure
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    page-count = #2
    system-system-spacing = #'((basic-distance . 13)
                               (minimum-distance . 10)
                               (padding . 0))
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new Devnull \structure
        \new ChordNames { \transpose c a \harmoniesAlto }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \alto
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 12)
                               (padding . 0))  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new Devnull \structure
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 12)
                               (padding . 0))  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new Devnull \structure
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
    page-count = #1
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 12)
                               (padding . 0))  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new Devnull \structure
        \new ChordNames { \transpose c a \harmoniesAlto }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \alto
        >>
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grilleAlto
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Da4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Devnull \structure
          \new PianoStaff <<
            \new Staff \with { instrumentName = \CleSol } \theNotes
            \new Staff { \clef "bass" \Piano }
          >>
          \new Staff \Basse
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Pianoa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new PianoStaff <<
          \new Devnull \structure
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff { \clef "bass" \Piano }
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Guitara4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new Staff \with { instrumentName = \CleSol } { \clef "treble_8" \Guitar }
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
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "GuitarTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new Staff \with { instrumentName = \CleSol } { \clef "treble_8" \Guitar }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-first-page-number = ##f
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 12)
                               (padding . 0))
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new Staff \with { instrumentName = \CleFa } \Basse
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
    ragged-last-bottom = ##f
    page-count = #2
    system-system-spacing = #'((basic-distance . 13)
                               (minimum-distance . 10)
                               (padding . 0))
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new Staff \with { instrumentName = \CleFa } \Basse
      >>
} } }
