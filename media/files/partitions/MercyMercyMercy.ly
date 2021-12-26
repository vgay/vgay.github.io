
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
  ragged-bottom = ##t
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Mercy, mercy, mercy"
composer = #"Joe Zawinul"
meter = #"(Med. Slow Funky Rock)"
kwtempo = #"Mod. Slow"
kwstyle = #"Funky Rock"

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
  asplayed = #"Cannonball Adderley" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=s4rXEKtC8iY"
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
bes4 es8/bes bes s2 es1 s1*6
bes2 es4./bes bes8 s2 es4./bes bes8 s1*2
bes2 bes4/d es f f:9sus4 s4. bes8 s2  bes4/d es f1 
c:m7 d:m7 g4:m f g:m f g1:m g4:m f g:m f g1:m

}


theNotes =  \relative c''' {
  \clef "treble" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:"
\repeat percent 4 { r4 \scoop g8 f~ 4 \scoop d8 bes | c bes bes g bes4 c-. } \break
\repeat percent 2 { << { bes4 4 8-. 4 8~ | 4 4 8-. 4 8\laissezVibrer } \\ 
                       { f4 f g8-. 4 as8~ | 4 4 g8-. 4 f8 \laissezVibrer } >> } \break
<< { bes4 \repeatTie 8 8 d d es es | f4-^ bes2->~ 8 r | r4 bes,8 8 d d es es | f4-. r r8 f,-. g bes-. }
   \\ { f4 \repeatTie bes,8 8 d d es es | f4-^ es'2->~ 8 r | r4 bes,8 8 d d es es | f4-. r r8 f,-. g bes-. } >> \break

<< { c'4. 8 r4. bes8-. | d4. 8 r4 d8-. f-. \toCoda  | g4.( f8-.) g4.( f8-.) g4-. } \\
   { g,4. 8 r4. f8 | a4. a8 r \parenthesize c,8 d f | g4.( f8-.) g4.( f8-.) g4-. } >> r2.
\bar ":|]" \break \Coda
<< { g'4 r8 f-. g4 r8 f-. | g1 } \\ { g,4 r8 f-. g4 r8 f-. | g1 } >>
\bar ".."
}

chordsRhythm = \relative c' {
\override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  c4 8 8_~ 4 4 | s1*7
  4 4 8-. 4 8~ | 4 4 8-. 4 8\laissezVibrer s1*2
  4 \repeatTie 8 8 8 8 8 8 | 4 4 8 8 8 8~ | 4 8 8 8 8 8 8 | 4 r r2
  4. 8\laissezVibrer s2 | 4. 8\laissezVibrer s2 | 4. 8 4. 8 | 4-. s2.
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key bes \major \time 4/4
  \repeat percent 4 { bes4. 8 d-. d4. | es es8 g g f a, }
  \repeat percent 2 { bes8 8 8 8 8 8 8 8 | 8 8 8 8 8 8 8 8 }
  8 8 8 8 d d es es | f4 4 8 8 8 bes,~ | 8 8 8 8 d d es es | f2. r8 f
  c4. 8~ 4 r8 8 | d4. 8~ 4 r8 f8 |g4.( f8) g4.( f8) g4 g'2 g,8 g,
  g'4 r8 f-. g4 r8 f-. | g1
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new ChordNames { \harmonies }
        \new Staff
         <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \Basse
        >> 
     >>
    } 
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new ChordNames { \harmonies }
        \new Staff
         <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \Basse
        >> 
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
          \transpose c d \theNotes
        >> 
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
          \transpose c a \theNotes
        >> 
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