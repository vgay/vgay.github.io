
\version "2.19.80"
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

title = #"Headin' Home"
composer = #"Joshua Redman"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

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
  url = #"https://www.youtube.com/watch?v=3WnLYIZaAF0"
  arranger = \markup \pad-around #1 \on-the-fly #played?
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
    %\override Clef #'break-visibility = #'#(#f #f #f)
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
  \set chordChanges = ##t
s1*2 d1*5:m
d1*4:m b1*2:9+ d1*2:m
d1*4:m b1*2:9+ d1*2:m 
bes2:13 e4:m7 a:5+7 as2:11+13 g:7 ges:5+ f:13 e:9+ a:8 es:7 d4:7 des:7
c2:9 b:9+ bes:7 e4:m7 a:7 d1*4:m
d1*4:m b1*2:9+ d1*2:m
bes2:13 e4:m7 a:5+7 as2:11+13 g:7 ges:5+ f:13 e:9+ a:8 es:7 d4:7 des:7
c2:9 b:9+ bes:7 e4:m7 a:7 r1*4 d:m
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \Intro a4 r16 16 8 r8. 16 r4 | r8. 16 r4 r2
  \compressFullBarRests
  \override MultiMeasureRest #'expand-limit = #2
  \repeat volta 2 { R1*3 } 
  \alternative { { R1 } { r2 r4 r16 a16 c8-. }  } \break
  \AetS d4-. f8 r16 gis~ \tuplet 3/2 { gis a gis } f g r8 g8 |
  g f r4 r16 f a,8 b f' | 
  d4 r r16 a c d r c a8 |
  f4 r r r16 a16 b8-. |
  d4-. fis8 r16 b~ \tuplet 3/2 { b c b } fis a r8 fis8 |
  f! es r4 r16 f d8 f f |
  d4 r r16 a c d r c a8 |
  f4 r r r16 a16 c8-. | \bar "||" \break
  r8 d r f r16 gis~ \tuplet 3/2 { gis a gis } g r16 g8 |
  r g f4 r16 f a,8 b f' | 
  d4 r r16 a c d r c a8 |
  f4 r r r16 a16 b8-. |
  r8 d r fis8 r16 b \tuplet 3/2 { c b fis } a8 r16 fis |
  r8 f! es4  r16 f d8 f f |
   d4 r r16 a c d r c a8 |
   f4 r r d'16 f r g~ \bar "||" \break
   \B g4 r16 f r8 a4-. f8. d16~ |
   d4 r8 d~ d4 d16 f r16 d~ |
   d4 r8 d~ d4 d16 f r16 g~ |
   g8. f16 g f c' a r4 d,16 f r g~ | \break
   g4 r16 f r8 a4-. f8. d16~ |
   d4 r8 d~ d4 d16 f r16 d~ |
   d4 r16 f r d a' c  \tuplet 3/2 { as g f } g8 f \bar "||" 
   \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
   \toCoda
   \break d4 r r2 R1 \comp #8 \break
   \mark \markup \rounded-box Soli
   \repeat volta 2 { 
     \comp #28 
     \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
     \once \override Score.RehearsalMark.extra-offset = #'(7 . 1)
     \mark \markup "on cue"
     r2 r4 d16 f r g~ 
   
   } \break
   4 r16 f r8 a4-. f8. d16~ |
   d4 r8 d~ d4 d16 f r16 d~ |
   d4 r8 d~ d4 d16 f r16 g~ |
   g8. f16 g f c' a r4 d,16 f r g~ | \break
   g4 r16 f r8 a4-. f8. d16~ |
   d4 r8 d~ d4 d16 f r16 d~ |
   d4 r16 f r d a' c r8 g f | d'-. b-. r16 f' r d r8. c16 r a r8 | \break
   r16 as r8 g16 f r d g f d c d8-. d' |
   \override TextSpanner.bound-details.left.text = "Drum file"
   \textSpannerDown 
   R1 \startTextSpan R1 \stopTextSpan \break
   \override TextSpanner.bound-details.left.text = "Drum with bass "
   \repeat volta 2 { R1 \startTextSpan R R R \stopTextSpan } 
   \break \DSalCoda 
   d4 r16 16 8 r8. 16 r4 | r8. 16 r4 r2
   \bar ".."
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key c \major \time 4/4
  a4 r16 16 8 r8. 16 r4 | r8. 16 r4 r8 a c cis
  \repeat volta 2 { d4 d' r16 a c d r16 c16 f,8 | d8 d d'4 r16 d, f d g8 f |
  d4 d' r16 a c d r16 c16 f,8 } 
  \alternative { 
    { d8 d d'4 r16 d, f d g8 f } 
    { d8  d d'4 r16 d, f d _"cont. simile" g8 f }   
  }
  s1*15 r2 r4 r8. bes,16~ | 2 e,4-. a8. as16~ | 4 r8 g8~ 4. r16 ges16~ |
  4 r8 f8~ 4. r16 e16~ | 4. r16 a r4 r8. es'16~ | 2 d4-. des8. c16~ |
  4 r8 b8~ 4. r16 bes16~ | 2 e4 a | d,4 d' r16 a c d r16 c16 f,8
  d4 d' r16 d, f8 g f | d4 d' r16 a c d r16 c16 f,8 | d4 d' r16 d, f8 g f |
  \comp #28 2 r4 r8. bes,16~
  2 e,4-. a8. as16~ | 4 r8 g8~ 4. r16 ges16~ |
  4 r8 f8~ 4. r16 e16~ | 4. r16 a r4 r8. es'16~ | 2 d4-. des8. c16~ |
  4 r8 b8~ 4. r16 bes16~ | 2 e4 a | d8-. b-. r16 f' r d r8. c16 r a r8 |
  r16 as r8 g16 f r d g f d c d8-. d' R1 R1
  R R R R d,4 r16 16 8 r8. 16 r4 | r8. 16 r4 r2
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #4
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 4 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
        %\new Staff \Basse
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes
        >> 
        %\new Staff \Basse
      >>
    } %\form
} }

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
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
        \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a, \theNotes
        >> 
        \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
} } }