
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Sidewinder"
composer = #"Lee Morgan"
meter = #"(Med. Soul)"
kwtempo = #"Medium"
kwstyle = #"Soul"

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
  asplayed = #"Lee Morgan" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=gcwvTaT3SKI"
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
    \override Glissando.style = #'zigzag
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
s8 s2 es1*4:7 as:7 es:7 f1*3:m7 bes1:7 es1*4:7 
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
\partial 8*5 r8 r2 
\repeat volta 2 {
  \repeat percent 2 { r4 c-^ r8 des-^ r4 } 
  r8 c des4 es  f | fis8( g es des) r a4.-> | \break
  as4-- f-^ r8 ges-^ r4 | r4 f-^ r8 ges-^ r4 
  r8 f' ges as bes as ges f | as es f ges ~ ges \glissando bes, as bes 
  es,4-- c'-^ r8 des-^ r4 | r4 c-^ r8 des-^ r4 
  r8 bes c des es f4. | r8 g, as a bes c4. \break
  \repeat percent 2 { r4 f,-^ r8 g-^ r4 } 
  r8 f g4 as a | a8 bes as e r e bes e 
  es4-- c'-^ r8 des-^ r4 | r4 c-^ r8 des-^ r4 |
  \once\override NoteHead.style = #'cross bes4-^ r8 bes16( des es8 es es16 bes des8 
  es4-^) r8 des(\mordent ~ des bes as bes) 
} }

chordsRhythm = \relative c''' {
\override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}



PartII =  \relative c'' { 
  \clef "treble" \key es \major \time 4/4
  
\partial 8*5 r8 r2 
\override TextSpanner.bound-details.left.text = "one octave lower "
\textSpannerDown
  \repeat percent 2 { r4 \startTextSpan fis-^ r8 g-^ r4 } 
  r8 \stopTextSpan c, des4 es  f | fis8( g es des) r a4.-> | 
  as4-- b-^ r8 c-^ r4 | r4 b-^ r8 c-^ r4 
  r8 f ges as bes as ges es | as es f ges ~ ges \glissando bes, as bes 
  es4-- fis-^ r8 g-^ r4 | r4 fis-^ r8 g-^ r4 
  r8 bes, c des es f4. | r8 g, as a bes c4. 
  \repeat percent 2 { r4 as-^ r8 b-^ r4 } 
  r8 f' g4 as a | a8 bes as e r e bes e 
  es4-- fis-^ r8 g-^ r4 | r4 fis-^ r8 g-^ r4 
  \once\override NoteHead.style = #'cross bes4-^ r8 bes,16( des es8 es es16 bes des8 
  es4-^) r8 des(\mordent ~ des bes as bes)
}



Basse = \relative c' { 
   \clef "bass" \key es \major \time 4/4
\partial 8*5  bes8 r bes e,4 
  \repeat percent 4 { es!4 r8 es bes4 d }
\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
\override Score.RehearsalMark #'self-alignment-X = #RIGHT
\override Score.RehearsalMark #'direction = #DOWN
\mark \markup { \bold "(Cont. simile)" }
} 
 

grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 es1:7 \break
 \repeat percent 4 as:7 \break
 \repeat percent 4 es:7 \break
  \repeat percent 3 f:m7 bes:7 \break
 \repeat percent 4 es:7 \break
  \bar ":|]" }

marques = \relative c' { 
  s1
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
        \new Staff \PartII
     \new Staff \Basse
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
        \new Staff \transpose c d \PartII
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
          \transpose c a, \theNotes
        >> 
        \new Staff \transpose c a, \PartII
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
          \theNotes \\ { s8 s2 s1*8 \break s1*8 \break }
         >> 
     \new Staff \PartII
     \new Staff \Basse
      >>
    } %\form
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
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \\ { s8 s2 s1*8 \break s1*8 \break }
        >> 
        \new Staff \transpose c d \PartII
      >>
    } %\form
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a, \theNotes \\ { s8 s2 s1*8 \break s1*8 \break }
        >> 
        \new Staff \transpose c a, \PartII
      >>
    } %\form
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