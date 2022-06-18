
\version "2.22.2"
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
}

title = #"Freddie Freeloader"
composer = #"Miles Davis"
meter = #"(Med. Swing)"
kwtempo = #"(Medium"
kwstyle = #"Blues"

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
  asplayed = #"Miles Davis" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=RPfFhfSuUZ4"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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
bes1*4:7 es1*2:7 bes:7
f2.:7 bes4:7 es1:7 as1*2:7
f2.:7 bes4:7 es1:7 bes1*2:7
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:"
\repeat volta 2 {
  g4. f8 ~ f2 ~ | f1 | g4. f8 ~ f2 ~ | f1
  c'4. bes8 ~ bes2 ~ | bes1 | g4. f8 ~ f2 ~ | f2. as4-_ \break
}
\alternative {
  {  a2. as8 g ~ | g2. f8 ges ~ | ges1 ~ ges  \break }
  {  a2. as8 g ~ | g2. f4-_ | g4. f8 ~ f2 ~ | f1 }
}

  \bar ".."
}

Voicing =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
\repeat volta 2 {
  <d bes>4. <c as>8 ~ <c as>2 ~ | <c as>1
  <d bes>4. <c as>8 ~ <c as>2 ~ | <c as>1
  <g' es>4. <f des>8 ~ <f des>2 ~ | <f des>1
  <d bes>4. <c as>8 ~ <c as>2 ~ | <c as>2. <d as>4-_
   }
 \alternative {
  { <es a,>2. < d as>4-_ < des g, >1 <c ges>1 ~ <c ges>1 }
  {  <es a,>2. < d as>4-_ < des g, >1 <d bes>4. <c as>8 ~ <c as>2 ~ | <c as>1 }
}
 }


grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 bes:7 \break
  \repeat percent 2 es:7 \repeat percent 2 bes:7 \break
  g2:7 c:7 f1:7 \set Score.repeatCommands = #'((volta "1"))
  \repeat percent 2 as:7
    \set Score.repeatCommands = #'((volta #f) end-repeat) \break
    \stopStaff s1 \bar "" s1 \startStaff  \set Score.repeatCommands = #'((volta "2"))
\repeat percent 2 bes:7 \set Score.repeatCommands = #'((volta #f))
  \bar ".." }

marques = \relative c' {

}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \Voicing
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \transpose c d \Voicing
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
        \new Staff \transpose c a \Voicing
      >> >>
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
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \Voicing
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
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
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \transpose c d \Voicing
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
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
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
        \new Staff \transpose c a \Voicing
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

