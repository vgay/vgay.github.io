\version "2.22.1"
#(set-global-staff-size 17)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "BookPartPagesNumber.ly"

\paper {
  indent = 0\mm
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 6)
                             (padding . 0))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  print-first-page-number = ##t
}

title = #"Cambios"
composer = #"David Torres"
meter = #"(Med. Salsa)"
kwtempo = #"Medium"
kwstyle = #"Salsa"
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
  asplayed = #"Poncho Sanchez" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=3MfSO4svhUQ"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}



\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
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
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "After Solos D.S. al Coda" } }
}

Ossature = \relative c' {
  \Intro
  \partial 8*5
  s8*5  \bar "||"
  s1*4 \break
  s1*4 \break \bar "||" \A
  s1*4 \break
  s1*4 \break \bar "||" \B
  s1*4 \break
  s1*4 \break \bar "||" \mark \markup { \raise #1.2 \with-color #red \bold \larger \musicglyph "scripts.varsegno" \box \bold \fontsize #2 "C" }
  s1*4 \break
  s1*4 \break \bar "||" \D
  s1*4 \break
  s1*4 \break \bar ".." 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 8 )
  \once \override Score.RehearsalMark.baseline-skip = #11
  \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup \with-color #red  \right-column { "fine"  "The 2 last bars are played 3x at last theme" }
}
OssatureTab = \relative c' {
  \Intro
  \partial 8*5
  s8*5  \bar "||"
  s1*4 \break
  s1*4 \break \bar "||" \A
  s1*4 \break
  s1*4 \pageBreak \bar "||" \B
  s1*4 \break \noPageBreak
  s1*4 \break \noPageBreak \bar "||" \mark \markup { \raise #1.2 \with-color #red \bold \larger \musicglyph "scripts.varsegno" \box \bold \fontsize #2 "C" }
  s1*4 \break \noPageBreak
  s1*4 \break \noPageBreak \bar "||" \D
  s1*4 \break\noPageBreak
  s1*4 \break \bar ".." 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 8 )
  \once \override Score.RehearsalMark.baseline-skip = #11
  \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup \with-color #red  \right-column { "fine"  "The 2 last bars are played 3x at last theme" }
}


Alto = \relative c' {
  \key bes \major \time 4/4 
  \partial 8*5
  f8 r f f4 -. \bar "||"
  es4. -- g8 bes4 -. a8 g -> | % 3
  r4 r8 f r f f4 -. | 
  es4. -- g8 bes4 -. g8 g -> | 
  r4 r8 c, r c c4 -. |
  es4. -- es8 g4 -. as8 g -> |
  r4 r8 f r f f4 -. |
  es4. -- d8 g4 -. fis8 g -> | 
  R1 \bar "||"
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> | 
  r8 bes c4 r4. d,8 | 
  es8 g bes d c bes a f | 
  bes8 f g as ~ -> as f fis g ~ -> |
  g8 es f ges ~ -> ges4 r |
  r8 f'4 -. -> f8 es4 -. -> r8 d -. -> | 
  r8 d es4 -. -> r4. g8 -- |
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> | 
  r8 bes c4 r4. d8 | 
  es8 g bes d c bes a f | % 22
  f8 f g e ~ -> e f ges es ~ -> | % 23
  es8 c d es ~ -> es4 r | % 24
  r8 bes'4 -. -> f8 bes4 -. r8 bes ~ | % 25
  bes8 f bes4 -. -> r2 \bar "||"
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. |
  r8 c4. -> cis -> c8 ~ -> |
  c4 b r8 c4. |
  b2 bes4. bes8 ~ |
  bes2 r4 bes -. | 
  ces2 -> bes4. -> bes8 -^ | 
  r2 r4. g8 \bar "||"
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> | 
  r8 bes c4 r4. d8 | 
  es8 g bes d c bes a f |
  f8 f g e ~ -> e f ges es ~ -> | 
  es8 c d es ~ -> es4 r | 
  r8 b4 -. -> b8 bes4 -. r8 as ~ |
  as8 as g4 -. r2 \bar ".."
}

Tenor = \relative c' {
  \key bes \major \time 4/4
  \partial 8*5 f8 r f f4 -. 
  d4. -- g8 bes4 -. a8 es -> | 
  r4 r8 f r f f4 -. |
  d4. -- g8 bes4 -. es,8 es -> |
  r4 r8 a, r a a4 -. |
  d4. -- d8 es4 -. fes8 es -> |
  r4 r8 f r f f4 -. |
  des4. -- c8 es4 -. des8 d -> |
  R1 
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |
  r8 bes c4 r4. d,8 | 
  es8 g bes d c bes a f | 
  bes8 f g as ~ -> as f fis g ~ -> | 
  g8 es f ges ~ -> ges4 r | 
  r8 c4 -. -> c8 b4 -. -> r8 bes -. -> |
  r8 bes c4 -. -> r4. g'8 -- | 
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |  
  r8 bes c4 r4. d8 | 
  es8 g bes d c bes a f |
  c8 c c bes ~ -> bes bes bes c ~ -> | 
  c8 c d es ~ -> es4 r |
  r8 bes'4 -. -> f8 bes4 -. r8 bes ~ | 
  bes8 f bes4 -. -> r2 
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. | 
  r8 f4. -> e4. -> es8 ~ -> | 
  es4 d r8 e4. |  
  es2 es4. d8 ~ | 
  d2 r4 d -. | 
  es2 -> es4. -> d8 -^ | 
  r2 r4. g8 |
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> |
  r8 bes c4 r4. d8 |
  es8 g bes d c bes a f |
  c8 c c bes ~ -> bes bes bes c ~ -> |
  c8 c d es ~ -> es4 r |  
  r8 f,4 -> f8 e4 -. r8 es ~ |
  es8 es d4 -. r2 |
}

Baryton = \relative c {
  \key bes \major
  \time 4/4
  \partial 8*5 f8 r f f4 -. |
  f4 -. f,2. ~ -> |
  f4 f'2 -> c4 -. | 
  r4 f,2. ~ -> |
  f4 f'2 -> c4 -. |
  r4 f,2 -> ges8 f |
  r4 r8 f' r f f4 -. | 
  c'4. -- bes8 ces4 -. bes8 bes -> |
  R1 |
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |
  r8 bes c4 r4. d8 |
  es8 g bes d c bes a f |
  bes8 f g as ~ -> as f fis g ~ -> |
  g8 es f ges ~ ->  ges4 r4 |
  r8 d4 -. -> d8 g,4 -. -> r8 c -. -> |
  r8 c f,2 r8 g' |
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |  
  r8 bes c4 r2 | 
  R1 | 
  f8 d es d ~ -> d cis d es ~ -> |
  es8 bes b c ~ -> c4 r | 
  r8 bes'4 -. -> f8 bes4 -. r8 bes ~ |
  bes8 f bes4 -. -> r2 |
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. |
  r8 d,4. -> a -> d,8 ~ -> | 
  d8 r g4 r8 c4. |  
  f2 des4. c8 ~ |
  c2 r4 g' -. |
  des2 -> ges,4. -> c8 -^ |
  r8 es, e f ~ -> f2 |
  R1*2 |
  r2 r4. d'8 |
  es8 g bes d c bes a f | 
  bes8 f g as ~ -> as f fis g ~ -> |
  g8 es f ges ~ -> ges4 r |  
  r8 des4 -. -> des8 c4 -. r8 ces ~ |
  ces8 ces bes4 -. r2 
}

TrompetteI = \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 8*5 f8 r f f4 -. |
  a4. -- g8 bes4 -. a8 c -> |
  r4 r8 f, r f f4 -. | 
  a4. -- g8 bes4 -. d8 c -> | 
  r4 r8 f, r f f4 -. | 
  c'4. -- bes8 d4 -. c8 es -> |
  r4 r8 f, r f f4 -. |
  c'4. -- bes8 es4 -. e8 f -> | 
  R1 | 
  \times 2/3 { f,8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> | 
  r8 bes c4 r2 | 
  R1*3 | 
  r8 bes'4 -. -> f8 bes4 -. -> r8 bes -. -> |
  r8 f bes4 -. -> r4. g8 |
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |  
  r8 bes c4 r4. d8 | 
  es8 g bes d c bes a f |
  bes8 f g as ~ -> as f fis g ~ -> |
  g8 es f ges ~ -> ges4 r |
  r8 bes4 -. -> f8 bes4 -. r8 bes ~ |
  bes8 f bes4 -. -> r2 |
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. | 
  r8 a'4. -> a -> a8 ~ -> |
  a4 a r8 a4. |  
  a2 g4. c8 ~ | 
  c2 r4 a4 -. |
  as2 -> ges8 es ges f |
  R1*3 |
  r2 r4. d,8 | 
  es8 g bes d c bes a f |
  bes8 f g as ~ -> as f fis g ~ -> | 
  g8 es f ges ~ -> ges4 r |
  r8 bes4 -. -> f8 bes4 -. r8 bes ~ | 
  bes8 f bes4 -. -> r2
}

TrompetteII = \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 8*5 f8 r f f4 -. 
  a4. -- g8 bes4 -. a8 c -> |
  r4 r8 f, r f f4 -. | 
  a4. -- g8 bes4 -. d8 c -> | 
  r4 r8 f, r f f4 -. | 
  g4. -- g8 bes4 -. bes8 b -> | 
  r4 r8 f r f f4 -. | 
  a4. -- es8 bes'4 -. a8  bes -> | 
  R1 |
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> | 
  r8 bes c4 r2 | 
  R1*3 | 
  r8 bes'4 -. -> f8 bes4 -. -> r8 bes -. -> |
  r8 f bes4 -. -> r4. g8 |
  \times 2/3 { f8 g f } d es f bes a g |
  f8 es d c d4 -- f8 c -> |  
  r8 bes c4 r4. d8 | 
  es8 g bes d c bes a f |
  c8 f g as ~ -> as f fis g ~ -> |
  g8 es f ges ~ -> ges4 r |
  r8 bes4 -. -> f8 bes4 -. r8 bes ~ |
  bes8 f bes4 -. -> r2 |
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. | 
  r8 a'4. -> a -> a8 ~ -> |
  a4 a r8 a4. |  
  d,2 es4. a8 ~ |
  a2 r4 a -. |
  as2 -> ges8 es ges f | 
  R1*3 |
  r2 r4. d,8 | 
  es8 g bes d c bes a f |
  bes8 f g as ~ -> as f fis g ~ -> | 
  g8 es f ges ~ -> ges4 r |
  r8 bes4 -. -> f8 bes4 -. r8 bes ~ | 
  bes8 f bes4 -. -> r2
}

Trombone = \relative f {
  \key bes \major  \time 4/4
  \partial 8*5 f8 r8 f8 f4 -. |
  f4. -- g8 bes4 -. a8 d -> |
  r4 r8 f, r f f4 -. |
  f4. -- g8 bes4 -. bes8 a -> |
  r4 r8 f r f f4 -. |
  bes4. -- bes8 g4 -. ges8 a -> |
  r4 r8 f r f f4 -. |
  g4. -- ges8 f4 -. e8 es -> |
  R1 |
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> |
  r8 bes c4 r4. d8 |
  es8 g bes d c bes a f |
  bes8 f g as ~  as f fis g ~ |
  g8 es f ges ~  ges4 r |
  r8 fis4 -. -> fis8 f4 -. -> r8 es -. -> |
  r8 es ges4 -. -> r4. g8 | 
  \times 2/3 { f8 g f } d es f bes a g | 
  f8 es d c d4 -- f8 c -> |  
  r8 bes c4 r2 | 
  R1 | 
  d'8 f, g ces ~  ces g g g ~ | 
  g8 es as bes ~ bes4 r | 
  r8 bes4 -. -> f8 bes4 -. r8  bes ~ |
  bes8 f bes4 -. -> r2 |
  b2 -- a4. -- d8 ~ -> | 
  d2. b4 -. |
  r8 a4. -> g -> fis8 ~ -> | 
  fis4 f r8 g4. |  
  a2 bes4. e,8 ~ | 
  e2 r4 f -. |
  fes2 -> fes4. -> es8 -^ |
  r8 g gis a ~ -> a2 |
  R1*2 |
  r2 r4. d,8 | 
  es8 g bes d c bes a f | 
  d'8 f, g c8 ~ c bes bes bes ~ |
  bes8 g a bes ~ bes4 r |  
  r8 es4 -. -> es8 d4 -. r8  des ~ |
  des8 des c4 -. r2 
}


Piano = \relative d' {
  \clef "treble" \key bes \major  \time 4/4
  \partial 8*5 f8 r f f4 -.
  <d es a>2 <d es bes'>4. <d es c'>8 -> | 
  R1 |
  <d es a>2 <d es bes'>4. <d es c'>8 -> | 
  R1 | 
  <d es c'>2 <d g d'>4 <fes as c>8 <es g es'>8 -> |
  r4 r8 f r f f4 -. | % 8
  <des f c'>4. -- bes'8 <ces, g es'>4 -. <bes fis e'>8 <es bes f'>8 -> | 
  R1 
  \comp #24 |
  r8 <fis c' f!>4. <f b es>4. <g bes d>8 ~ |
  <g bes d>4 <ges c es>2 r4 | 
  \comp #16 |
  <c, f bes>8 r4 <bes fes' as>8 ~ q r4 <c g' bes>8 ~ |
  <c g' bes>8 r4 <bes es ges>8 ~ q4 r |
  r8 <bes es g>4  q8 <bes es a>4 r8 <bes d f bes> ~ |
  q8 q q4 r2 |
  \comp #8 |
  r8 <f' a c>4. <e g cis>4. <fis a c es>8 ~ | 
  q4 <f! b d a> r8 <e g a c>4.
  <es g b d>2 <f b es>4. <e g bes des>8~ |
  q4 \comp #3 | 
  <fes as ces es>2 <fes bes es>4. <f bes es>8 |
  r8 <es g'>8 <e gis'> <f a'> ~ -> q2 
  \comp #16 | <c f bes>8-. r4 <bes fes' as>8~ q r4 <bes es g>8~ |
  q r4 <bes es ges>8~ q4 r4
  r8 <ces es g bes>4.  <bes d fis bes>4. <as des ges bes>8 ~ | 
  <as des ges bes>4 <g c f bes>4 -. r2 
}


Basse = \relative f {
  \key bes \major \time 4/4
  \partial 8*5 f8 r f f4 -. | 
  r4 f,2 -> c'4 -> | 
  r4 f2 -> c4 -> | 
  r4 f,2 -> c'4 -> | 
  r4 f2 -> c4 -> | 
  r4 f,2 -> ges8 f | 
  r4 r8 f' r f f4 -. | 
  es4. -- d8 des4 -. c8 f, -> |
  R1 |
  bes4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. bes'8 d, ~ d4 f -. |
  es4 -. g8 c, ~ c4 f -. |
  r8 -\f d4 -. -> d8 g,4 -. -> r8 c -. -> |
  r8 c8 f,2 r4 |
  bes4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. r8 d ~ d cis d es ~ |
  es8 bes8 b8 c8 ~ c2 |
  r8 c4 -. -> g'8 f4 -. r8 bes, ~ |
  bes8 f' bes4 -. -> r2 |
  d,4. a' d4 ~ |
  d4. a8 ~ a4 d, |
  r8 d4. a d8 ~ | 
  d4 g, r8 c4. |  
  f,2 des'4. r8 |
  c2. g'4 |
  des2 ges,4. c8 |
  r8 g gis a ~ -> a2 |
  bes4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. f'8 g, ~ g4 d' -. |
  c4 -. f8 f, ~ f4 f' -. |
  bes,4 -. bes'8 d, ~ d4 f -. |
  es4 -. g8 c, ~ c4 f -. |  
  r8 des4 -. -> des8 c4. -. ces8 ~ |
  ces8 ces bes4 -. -> r2 
}

Accords = \chordmode {
  \partial 8*5
  s8*5 
  f2:13.11 c4.:m9 f8:13.11 | 
  s1 | 
  f2:13.11 c4.:m9 f8:13.11 | 
  s1 | 
  f2:13.11 c4:m9 ges8:7.5-.9 f8:9.5- | % 7
  s1 | % 8
  des2.:13.11.11+ c8:7.5- f8:sus4.7 | % 9
  s1 
  % A
  bes2:maj7 g2:m7 |
  c2:m7 f2:7 | 
  bes2:maj7 g2:m7 | 
  c2:m7 f2:7 | 
  bes1:maj7 es4.:maj7 
  es8:m7/+c s2
  s8 d4.:7.9+ g4.:aug7 c8:m9 |
  s4 c2.:m5-7/f 
  % A'
  bes2:maj7 g2:m7 |
  c2:m7 f2:7 |  
  bes2:maj7 g2:m7 | 
  c2:m7 f2:7sus4 | 
  bes4.:9 bes2:5-9/d es2:6
  c2.:m5-7 c4.:m7 f:7sus4 bes8 s1
  % B
  d1*2:13 s8 d4.:m7 a:7 
  d:9- g:9 c:6
  f2:11+13 des4.:11+13 c:9-13 s2 g4:m9
  des2:m9 ges4.:13 c8:m11 s1
  % A
  bes2:maj7 g2:m7 |
  c2:m7 f2:7 |
  bes2:maj7 g2:m7 | 
  c2:m7 f2:7 | 
  bes4.:6.9 bes2:5-9/d es2:6
  c:m5-7 s4 
  des4.:13.11.11+ c:13.11.11+ ces:6.9 bes:6.9
}

grille = \chordmode {
  bes2:maj7 g2:m7 |
  c2:m7 f2:7 | 
  bes2:maj7 g2:m7 | 
  c2:m7 f2:m7 | 
  bes1:7 |
  es2:maj7 es2:m6
  d2:7.9+ g:9+ |
  c:m7 f:9+
  c:m7 f:7
  bes1:7+

  % B
  a1:m7 d:7 d:m7 g:7 g:m7 c:7
  des2:m7 ges:7 c:m7 f:7
  % A
  bes2:maj7 g2:m7 |
  c2:m7 f2:7 | 
  bes2:maj7 g2:m7 | 
  c2:m7 f2:m7 | 
  bes1:7 |
  es2:maj7 es2:m6
  c:m7 f:7
  bes1:7+
  
}



backgroudI = \relative c' {
  \mark \markup { \box \bold \fontsize #2 E}
  \repeat volta 2 {
    f2 _\markup \raise #-3 \small "Baryton with Trombone" g | bes a | c bes | e d4. f8-> |\break \noPageBreak
    r2 _\markup \raise #-3 \small "Tenor Sax with Trumpet" as | g ges 
  }
  \alternative {
    { f2 bes | es,4. as8~ as2 } { f1~ | f4 r4 r2 \bar "||"}
  }
  \mark \markup { \box \bold \fontsize #2 F}
  \break \noPageBreak R1 R1 R1 R1  
  
  << { \voiceOne bes,1 | a1 | as2~ as8 bes as g~ | g2. r4 \bar "||" \break} 
     \new Voice { \voiceTwo  
                  f1  ^\markup \small "Tenor Sax with Trumpet" | e | e2.. es8~ | es2. r4 } >>
  \oneVoice 
  \mark \markup { \box \bold \fontsize #2 G}
  \break R1 R1 R1 R1  
  r2 as'4-. bes8 g~ | g bes4-. ges-. bes-. f8~ | 2 es4. d8~ | 2 r  \break \bar "||-[|:"
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red \concat { "Go to "\box E" for more solos" }
}

backgroudII = \relative c {
  \repeat volta 2 {
    f2 g | bes a | c bes | e d4. f8-> |\break
    r2  as | g ges 
  }
  \alternative {
    { f2 bes | es,4. as8~ as2 } { f1~ | f4 r4 r2 \bar "||"}
  }
  \break R1 R1 R1 R1  
  
  
  << { \voiceOne bes1~ _\markup \small "Baryton with Trombone" | bes | as2 g4. g8~ | g2 f4 r } 
     \new Voice { \voiceTwo \afterGrace g,1 { a8[ bes b] } | c1 | des2.. c8~ | \afterGrace c2  { bes8[ a g] } f4 r } >>
  \break \oneVoice R1 R1 R1 R1  
  r2 as'4-. bes8 g~ | g bes4-. ges-. bes-. f8~ | 2 es4. d8~ | 2 r  
} 

montunoPiano = \relative c'' {
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Open percussion solo over montuno"
  \repeat volta 2 {
    <g g'>4 <bes d> r8 <f f'> r <g g'> | r <c es>4 <g g'> <c es> <a a'>8 |
    <g g'>4 <bes d> r8 <f f'> r <g g'> | r <c es>4 <g g'> <c es> <a a'>8 |
    \once \override Score.RehearsalMark #'direction = #DOWN
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup \with-color #red "After solos D.S. al fine"
  } 
}
montunoBasse = \relative c' {
  bes4. \repeatTie g8~ g4 c~ | c4. f,8~ f4 bes~ |
  bes4. g8~ g4 c~ | c4. f,8~ f4 bes \laissezVibrer
}

montunoChords = \chordmode {
  bes2:6 g:m7 | c:m7 f:7 | bes2:6 g:m7 | c:m7 f:7 
}


% Version C format A4
\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph "clefs.G_change" " "} }
          \fill-line { "C version" } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Full Score \fontsize #-2 "(Instruments tone)"} }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax, c version)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax, c version)" } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax, c version)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1, c version)" } }
          \vspace #0.3
          \page-link #16 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2, c version)" } }
          \vspace #0.3
          \page-link #18 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #20 \line  {  \hspace #10 \underline { Piano \fontsize #-2 "(or Guitare, concert key)" } }
          \vspace #0.3
          \page-link #22 \line  {  \hspace #10 \underline { Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Full Score" } } }
    }
    \score {
      <<
        \new StaffGroup <<
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } }
            \set Staff.shortInstrumentName = "A.Sx"

            \context Staff <<
              \new Voice = "Alto" { \transpose c a \Alto }
              \new Voice = "Ossature" \Ossature
            >>
          >>
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } }
            \set Staff.shortInstrumentName = "T.Sx"

            \context Staff <<
              \context Voice = "Tenor" { \transpose c d' \Tenor }
            >>
          >>
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } }
            \set Staff.shortInstrumentName = "B.Sx"

            \context Staff <<
              \context Voice = "Baryton" { \transpose c a' \Baryton }
            >>
          >>
        >>
        \new StaffGroup <<
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } }
            \set Staff.shortInstrumentName = "Tp.1"

            \context Staff <<
              \context Voice = "TrompetteI" { \transpose c d \TrompetteI }
            >>
          >>
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
            \set Staff.shortInstrumentName = "Tp.2"

            \context Staff <<
              \context Voice = "Trompette 2" { \transpose c d \TrompetteII }
            >>
          >>
          \new Staff
          <<
            \set Staff.instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }
            \set Staff.shortInstrumentName = "Tbn."

            \context Staff <<
              \context Voice = "Trombone" { \clef "bass" \Trombone }
            >>
          >>
        >>
        \new StaffGroup <<
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } }
          \set Staff.shortInstrumentName = "Pno."
 
          \context Staff <<
            \context Voice = "Piano" { \Piano }
          >> 
        >>
 
        \new ChordNames = "Accords" { \Accords}

        \new Staff
        <<
          \set Staff.instrumentName = "Bass"
          \set Staff.shortInstrumentName = "Bass"

          \context Staff <<
            \context Voice = "Basse" { \clef "bass" \Basse }
          >>
        >>
      >>
      >>
      \layout {}
    }
    
    
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
  
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 1" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Alto" { \clef "treble_8" \Alto }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 2" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \clef "treble_8" \Tenor }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 3" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Baryton" { \clef "bass" \Baryton }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 4" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \TrompetteI }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 5" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \TrompetteII }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Horn 6" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombpne" { \clef "bass" \Trombone }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Piano" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } }
 
          \context Staff <<
            \new Voice = "Piano" { \Piano }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Cambios (David Torres) - C version - Bass" } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Bass"
 
          \context Staff <<
            \new Voice = "Basse" { \clef "bass" \Basse }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}

% Version Bb format A4
\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " B  \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 \concat { "(Alto Sax, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 \concat { "(Baryton Sax, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 \concat { "(Trombone, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline "Wind Bass" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Alto" {  \transpose c d' \Alto }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \transpose c d' \Tenor }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" }} }
 
          \context Staff <<
            \new Voice = "Baryton" { \transpose c d'' \Baryton }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 4" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4"\line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \transpose c d \TrompetteI }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 5" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \transpose c d \TrompetteII }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Horn 6" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6"\line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombone" { \transpose c d' \Trombone }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - B"\flat" version - Wind Bass" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Wind" \line {"Bass"} }  }
 
          \context Staff <<
            \new Voice = "Basse" { \transpose c d'' \Basse }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}

% Version Eb format A4
\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " E  \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 \concat { "(Tenor Sax, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 \concat { "(Trumpet 1, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 \concat { "(Trumpet 2, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline{  Horn VI \fontsize #-2 \concat { "(Trombone, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline "Wind Bass" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" }} }
 
          \context Staff <<
            \new Voice = "Alto" { \clef "treble" \transpose c a \Alto }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \transpose c a \Tenor }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Baryton" { \clef "treble" \transpose c a' \Baryton }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 4" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \transpose c a \TrompetteI }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 5" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \transpose c a \TrompetteII }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Horn 6" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombone" { \transpose c a' \Trombone }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Cambios (David Torres) - E"\flat" version - Wind Bass" } } } }
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Wind" \line {"Bass"} }  }
 
          \context Staff <<
            \new Voice = "Basse" { \transpose c a' \Basse }
            \new Voice = "Ossature" \Ossature
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \transpose c a \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}

% Version Bb format A5
\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " B  \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 \concat { "(Alto Sax, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 \concat { "(Baryton Sax, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #18 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #22 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 \concat { "(Trombone, B"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #26 \line  {  \hspace #10 \underline "Wind Bass" }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Alto" {  \transpose c d' \Alto }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \transpose c d' \Tenor }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" }} }
 
          \context Staff <<
            \new Voice = "Baryton" { \transpose c d'' \Baryton }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4"\line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \transpose c d \TrompetteI }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \transpose c d \TrompetteII }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6"\line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombone" { \transpose c d' \Trombone }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Wind" \line {"Bass"} }  }
 
          \context Staff <<
            \new Voice = "Basse" { \transpose c d'' \Basse }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c d \backgroudI >>
          \new Staff
          << \transpose c d' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c d, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}

% Version Eb format A5
\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " E  \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 \concat { "(Tenor Sax, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 \concat { "(Trumpet 1, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #18 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 \concat { "(Trumpet 2, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #22 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 \concat { "(Trombone, E"\flat" transposed version)" } } }
          \vspace #0.3
          \page-link #26 \line  {  \hspace #10 \underline "Wind Bass" }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Alto" {  \transpose c a \Alto }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \transpose c a \Tenor }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" }} }
 
          \context Staff <<
            \new Voice = "Baryton" { \transpose c a' \Baryton }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4"\line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \transpose c a \TrompetteI }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c d \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \transpose c a \TrompetteII }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c d \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6"\line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombone" { \transpose c a' \Trombone }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Wind" \line {"Bass"} }  }
 
          \context Staff <<
            \new Voice = "Basse" { \transpose c a' \Basse }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \transpose c a \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \transpose c a, \backgroudI >>
          \new Staff
          << \transpose c a \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \transpose c a \montunoChords}
          \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
          << \clef "treble_15" \transpose c a, \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}


% Version C format A5
\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #3
        \fill-line { \fontsize #9 "Cambios" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph "clefs.G_change" " "} }
          \fill-line { "C version" } 
        }
        \vspace #1      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #18 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #22 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #26 \line  {  \hspace #10 \underline { Piano \fontsize #-2 "(or Guitare)" } }
          \vspace #0.3
          \page-link #30 \line  {  \hspace #10 \underline { Bass } }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Alto" { \clef "treble_8" \Alto }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(T. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Tenor" { \clef "treble_8" \Tenor }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(B. Sax)" } } }
 
          \context Staff <<
            \new Voice = "Baryton" { \clef "bass" \Baryton }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } }
 
          \context Staff <<
            \new Voice = "Trompette1" { \TrompetteI }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }
 
          \context Staff <<
            \new Voice = "Trompette2" { \TrompetteII }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }
 
          \context Staff <<
            \new Voice = "Trombpne" { \clef "bass" \Trombone }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } }
 
          \context Staff <<
            \new Voice = "Piano" { \Piano }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } 
              poet = \markup \with-color #red "4 pages score" }
    \score {
      <<
        \new ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Bass"
 
          \context Staff <<
            \new Voice = "Basse" { \clef "bass" \Basse }
            \new Voice = "Ossature" \OssatureTab
          >>
        >>
      >>
    }
    \score {
      <<
        \new ChordNames = "Accords" { \grille}
        \new Staff \with { instrumentName = "Solos" }
        << \comp # 104 >>
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Background" \line { "last x" } } } }
        << 
          \new Staff 
          << \backgroudI >>
          \new Staff
          << \transpose c c' \backgroudII >>
        >>
      >>
    }
    \score {
      <<
        \new PianoStaff
        << 
          \new Staff \with { instrumentName = "Pno" }
          << \montunoPiano >>
          \new ChordNames = "Accords" { \montunoChords}
          \new Staff \with { instrumentName = "Bass" }
          << \clef "bass" \montunoBasse >>
        >>
      >>
      \layout { indent = 0 }
    }
  }
}