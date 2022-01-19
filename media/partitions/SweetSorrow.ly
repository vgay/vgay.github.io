
\version "2.22.0"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Sweet Sorrow"
composer = #"Joshua Redman"
meter = #"(Ballad)"
kwtempo = #"Slow"
kwstyle = #"Ballad"

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
  asplayed = #"Joshua Redman" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=NgH6HxF2790"
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
s8 g1*4:m7+ g1*5:m7+
\repeat unfold 8 { es2:7 as:m6/es }
g1*5:m7+ \repeat unfold 4 { es2:7 as:m6/es }
des:9.11+ c:m7 b:5+7 es/bes a:m5-7 d:9+ 
g1*4:m7+ a2:m5-7 d:9+ g:m7+
}


theNotes =  \relative c''' {
  \clef "treble" \key bes \major \time 4/4
  \partial 8 r8 \Intro
  R1 R1 R1 r2 r8 \scoop d4 g,8 \break \A
  \repeat volta 2 { 
  a2. d16 g, a d, | fis2~ 8 d16 e \tuplet 3/2 { fis g fis8 e16 d } |
  fis8 4.~ 8 des~ \tuplet 3/2 { des c bes } }
  \alternative {
    { d2. \scoop d'8 g, } { c,32 bes g fis g8~ 4~ 8 4. \glissando }
  } \break \B
  bes2~ 8 es, des' ces16 des | bes2. as8 g16 as|
  bes2~ 8  es,16 es es'8 des16 ces | bes2~ 8 bes( es) bes | \break
  es2~ 8 16 16 as8 ges | es2~ 8 16 16 ces'8 f, |
  es2~ 8 16 16 des8 bes | es2~ 8 \scoop es'8~ \tuplet 3/2 { es d g, } \break \A
  
   \repeat volta 2 { 
  a2. d16 g, a d, | fis2~ 8 d16 e \tuplet 3/2 { fis g fis8 e16 d } |
  fis8 4.~ 8 des~ \tuplet 3/2 { des c bes } }
  \alternative {
    { d8 4.~ 4 \scoop d'8 g, } { c,32 bes g fis g8~ 4~ 8 4. \glissando }
  } \break \C
  
  \break \C bes2 8 es, des' ces16 des | bes2. as8 g16 as|
  bes2~ 8  es,16 es es'8 des16 ces | bes2. \tuplet 3/2 { r8 g g } | \break
 \override TextSpanner.bound-details.left.text = "rubato" \textSpannerDown
  g4~ \startTextSpan \tuplet 3/2 { 8 bes b } g4~ \tuplet 3/2 { 8 f es } |
  g4 des'8 b g4~ \tuplet 3/2 { 8 f es } | \toCoda
  g4~ \tuplet 3/2 { 8 f es } f4 \stopTextSpan d |  \break
  a'2.\trill _\markup "a tempo" \comp #1 |
  \comp #12 \break \bar "|."
  \Coda g4~ \tuplet 3/2 { 8 f es } f4 d' | a'1 \fermata \bar ".."

}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  \partial 8 s8 
  r4 d8 8~ 2 | r4 d8 8~ 2 | r4 d8 8~ 2 | r4 d8 8~ 2 ^"pn. cont. simile" |
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key bes \major \time 4/4
  \partial 8 d8 
  g,2~ 4. d'8 | g,2~ 4. d'8 | g,2~ 4. d'8 | 
  \once \override TextScript #'extra-offset = #'( 7 . 0 )
  g,2~   4. d'8 | 
  \repeat unfold 4 {  g,2~ 4. d'8 | } |  g,2~ 8 a bes d |
  \repeat unfold 3 {  es2~ 4. bes'8 | } | es,2.~ \tuplet 3/2 { 8 bes' d, }
  \repeat unfold 3 {  es2~ 4. bes'8 | } | 
  es,2 \tuplet 3/2 { bes'8 es, bes } \tuplet 3/2 { a d a }
  \repeat unfold 4 {  g2~ 4. d'8 | } |  g,2~ 8 a bes d |
  \repeat unfold 3 {  es2~ 4. bes'8 | } | es,2. \tuplet 3/2 { r8 es d }
  << { \improvisationOn \override NoteHead.no-ledgers = ##t d'2 d d d d d 4 4 \repeat unfold 4 { r4 d8 8~ 2 } 2 4 4 1\fermata \improvisationOff } \\ { des,2 c | b bes a d4 4 
  \repeat unfold 2 { g2~ 4. d8 } \repeat unfold 2 { g,2~ 4. d'8 } a2 d4 d g1 \fermata } >>
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
        %\new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
        % \new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } \transpose c d \theNotes
        %\new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
        %\new Staff \with { \RemoveEmptyStaves }  << \chordsRhythm \\ \Basse >>
      >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
