
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
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
  print-page-number = ##f
}

title = #"Bag's Groove"
composer = #"Milt Jackson"
meter = #"(Med. Blues)"
kwtempo = #"Medium"
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
  % asplayed = #"" % doit être commentée si vide
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
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
  f1:7 bes:7 f:7 s bes:7 s f:7 s g:m7 c:7 f:7 g2:m7 c:7
f1:7 bes:7 f:7 s bes:7 s f:7 s g:m7 c:7 f:7 \startParenthesis \parenthesize g2:m7 \endParenthesis \parenthesize c:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  %\showStartRepeatBar \bar "[|:"
\partial 4 f4 \bar "||" 
\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
\mark \markup "Voice 1"
c'2. bes8 as | bes4 as8 f as4 f8 es | f4. es8 r2 | r2 r4 f4 | \break
c'2. bes8 as | bes4 as8 f as4 f8 es | f4. es8 r2 | r2 r4 f4 | \break
c'2. bes8 as | bes4 as8 f as4 f8 es | f4. es8 r2 | r2 r4 c'4 \bar "||" \break
f2. es8 c | es4 c8 bes c4 bes8 as | bes4. as8 r2 | r2 r4 c4 | \break
f2. es8 c | es4 c8 bes c4 bes8 as | bes4. as8 r2 | r2 r4 c4 | \break
f2. es8 c | es4 c8 bes c4 bes8 as | bes4. as8 r2 | R1 \bar ".."
}

VoiceII =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  %\showStartRepeatBar \bar "[|:"
\partial 4 f4 \bar "||" 
\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
\mark \markup "Voice 2"
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | r2 r4 f4 | \break
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | r2 r4 f4 | \break
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | r2 r4 f4 \bar "||" \break
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | r2 r4 f4 | \break
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | r2 r4 f4 | \break
as2. g8 f | g4 f8 es f4 es8 c | es4. c8 r2 | R1 \bar ".."
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
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
  } }
     \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \VoiceII
        >> 
      >>
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
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >> 
      >>
  } }
     \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \VoiceII
        >> 
      >>
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >> 
      >>
  } }
     \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \VoiceII
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
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
  } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \VoiceII
        >> 
      >>
    } %\form
} }

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
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >> 
      >>
  } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \VoiceII
        >> 
      >>
    } %\form
} }

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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >> 
      >>
  } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \VoiceII
        >> 
      >>
    } %\form
} }
