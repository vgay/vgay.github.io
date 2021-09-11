
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
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"I Remember Clifford"
composer = #"Benny Golson"
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
  asplayed = #"Art Farmer & Benny Golson" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=R9FqeQXRT-Y"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
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
  \set chordChanges = ##t
as1:7+ bes2:13 bes:13/as g2:7 as:dim7
c4:m7 bes:m7 as:m7 ges:m7 f1:m9 bes2:9sus4 bes:9-sus4
es:7+ g:9- as:7+ a:dim7 g:m/bes b:dim7 c:m c:m/bes
a:m5-7 d:5+7.9- g:m7 g:m/f e:m5-7 a:5+7.9- f:m7 bes:9-
a:m5-7 d:5+7.9- g:m5-7 c:5+7.9- f2:m7 bes:5+7.9+/as g:m7 as:7+

a:m5-7 d:5+7.9- g4:m7 c2.:5+7.9- f2:m7 bes:5+7.9- es1:7+
d2:m5-7 g:5+7.9+ c:m7 c:m/bes a:m5-7 d:5+7.9+ g4:m7 c:9 f:m7 bes:5+7.9-

es2:7+ g:9- as:7+ a:dim7 g:m/bes b:dim7 c:m c:m/bes
a:m5-7 d:5+7.9- g:m5-7 c:5+7.9- f:m7-7 bes:5+7.9- es:6 bes:9- 
f:m7-7 bes:5+7.9-/as g:m7 fis:m6 f1:m7
bes2:13 bes:13/as g2:7 as:dim7
c4:m7 bes:m7 as:m7 ges:m7 f1:m9 bes2:9sus4 bes:9-sus4
es1:7+
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
\Intro r8 c es g bes as es f 
g g~ g2.
r8 g b d g4. d8 \break
es1
r8 c, es f g4 es8 c 
es es4. r4 d' \break
\repeat volta 2 {
    \A
    g,2. f8 d es2 
    r8 f g as
    bes4. bes8 b as d b
    c2 r8 g c d
    \break
  }
  \alternative {
    { es2. d8 c
    bes16 c d4. r8 d, g a
    bes2. a8 g as!2. bes4 \break
    }
    { es2 r8 f, bes c
    des2. r8 c 
    f,4. c'8 fis,4. d'8
    g,4. es'8 c4. d8 \bar "||" } }
    
   \break
  \B 
  es2 d8 c bes c
  d4 des4 r8 c, es f
  g c, es f ges4 b4
  bes!2. f8 g \break
  as4. as8 bes as g f
  g2 r8 g c d 
  es4. es8 f es d c
  d g, bes d c4 bes \break \bar "||"

    \A
    g2. f8 d es2 
    r8 f g as
    bes4. bes8 b as d b
    c2 r8 g c d
    \break

   es2 r8 f, bes c 
  des2 r8 c, es f \Coda
  g c, es f ges4 d 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup\pad-markup #4 " "
  es1
  \bar "|." \break
  \Coda
  g8 c, e f fis4 ces' | bes2 b |
  r8 c, es g bes as es f 
g g~ g2.
r8 g b d g4. d8 \break
es1
r8 c, es f g4 es8 c 
es es4.~ 8 e as ces | bes1 \fermata \bar ".."
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
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
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
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
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
      >>
} } }