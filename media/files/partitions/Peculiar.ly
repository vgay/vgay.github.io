
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
  markup-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 10)
                            (padding . 5))
}

title = #"Peculiar"
composer = #"John Scofield"
meter = #"(Up Straight)"
kwtempo = #"Fast"
kwstyle = #"Straight"

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
  asplayed = #"John Scofield" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=ezgCbELJsT0"
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
     \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
                \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
     }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over f minor" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t

}



theNotes =  \relative c {
  \clef "treble_8" \key es \major \time 4/4
   \compressMMRests
\override MultiMeasureRest #'expand-limit = #3
  \showStartRepeatBar \bar "[|:"
  %\defineBarLine "||-[|:" #'("||" "[|:" "[|:") 
  \repeat volta 2 {
  \A r8 ^\markup "guitar & organ 1st x, with trumpet 1 octave up 2nd x" d r as' r e r g | r f r bes r f g4 | as g8 as a bes b c | des4 r r es | \noPageBreak \break
  des4. c8 bes4 des | r8 c r bes r as r4 | f f f f8 f | f f f f r2 }
  \alternative { 
    { R1*4 \break \bar ":|][|:" \noPageBreak }
    { \B as4-. ^\markup "guitar with trbn" bes-. r8 as r bes |  }
  }
  ces bes as r r as r bes8~ | 4 as8 bes ces bes as4 | bes4 as r8 f r4 \bar ":|]" \break \noPageBreak
\A r8 ^\markup "guitar, organ and trumpet 1 octave up" d r as' r e r g | r f r bes r f g4 | as g8 as a bes b c | des4 r r es | \noPageBreak \break
  des4. c8 bes4 des | r8 c r bes r as r4 | f f f f8 f | f f f f r2 | 
  R1*7 | r2 r4 f8 g |
  \bar "||-[|:" \break
  \repeat volta 3 {
  \C as ^\markup "guitar only 1st x, with organ 2nd x, organ only 3rd x" bes g4 as des | r2 r4 e,8 f | g as f4 g c | r4 es-. des4. c8 | \break
  bes4 des c4. bes8 | r as r4 r f8 f | r f r f r f r f }
  \alternative { { f f f f r4 f8 g } { f f f f r2 } } 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Silence" R1 R1 \bar ".."
}

VoiceC = \relative c' {
  s1*32
  r8 -\markup "guitar 3rd x only" d r as' r e r g | r f r bes r f g4 | as g8 as a bes b c | des4 r r es | \break
  des4. c8 bes4 des | r8 c r bes r as r4 | f f f f8 f | R1
  f8 f f f r2 | R1 R1
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key es \major \time 4/4
  \mark \markup "bass pattern for the whole piece (theme and solos) "
  f8 f r4 es r | d8 r4 cis8~ 4 c | r f, es'8 es r4 d8 r4 cis8~ 4 c | \noPageBreak
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
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
   \score {
      \new Staff << \Basse >>
    }
     \score {
      <<
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff << \VoiceC >>
        >>   
      >>
    } 
    \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over f minor" } }
}
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
      \new Staff << \Basse >>
    }
    \score {
      <<
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >> 
        \new Staff << \transpose c d \VoiceC >>
        >>   
      >>
    } 
    \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over g minor" } }
}
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
      \new Staff << \Basse >>
    }
    \score {
      <<
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >> 
        \new Staff << \transpose c a \VoiceC >>
        >>   
      >>
    } 
    \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over d minor" } }
}
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      \new Staff << \Basse >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff << \VoiceC >>
        >>
      >>
    } 
    \form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
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
      \new Staff << \Basse >>
    }
    \score {
      <<
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >> 
        \new Staff << \transpose c d \VoiceC >>
        >>   
      >>
    } 
    \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over g minor" } }
}
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
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
      \new Staff << \Basse >>
    }
    \score {
      <<
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >> 
        \new Staff << \transpose c a \VoiceC >>
        >>   
      >>
    } 
    \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos over d minor" } }
}
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

