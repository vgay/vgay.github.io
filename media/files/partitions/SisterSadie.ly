
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

title = #"Sister Sadie"
composer = #"Horace Silver"
meter = #"(Med. Up Swing)"
kwtempo = #"Med. Up"
kwstyle = #"Swing"

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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=SmO2pM20MrU"
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
  \parenthesize as4.:13 g1.:13 s8 \parenthesize as4.:13 
  g1.:13 s8 \parenthesize as4.:13 g1.:13 s8 \parenthesize as4.:13
  g1.:13 s8 \parenthesize as4.:13 g1:13
  c1*2:13 bes:13 c1:13 bes:13 a:13 as:13

  g1.:13 s8 \parenthesize as4.:13 
  g1.:13 s8 \parenthesize as4.:13 g1.:13 s8 \parenthesize as4.:13
  g1.:13 s8 \parenthesize as4.:13

  g1.:13 \times 2/3 { s4 c4:7 b:7 } bes4.:7 a8:7 s2 s \times 2/3 { s4 bes4:7 a:7 } as4.:7 g8:7 s2
}

hChorus= \chordmode {
  \set chordChanges = ##t
  g1*8:13
  c1*2:13 bes:13 c1:13 bes:13 a:13 as:13
  g1*8:13
}

theNotes =  \relative c''' {
  \clef "treble" \key c \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 4. r4.
  \repeat volta 2 {
    \A
    r8 g,4-^ bes8 b d e d | g4. b8 r2 |
    r8 g,4-^ bes8 b d e d | g4. e8 r8 r4. \break
    r8 g,4-^ bes8 b d e d | 
    e' bes4. g4-^ r8 g-. bes b-. bes-. b-. \times 2/3 { g16 a g } f8 d c
  } 
  \alternative {
    { \times 2/3 { d c bes } g f g-. r4. }
    { \times 2/3 { d'8 c bes } g f g4 r4 }
  }
  \bar "||" \break \B
  r2 \times 2/3 { r4 g bes } | \times 2/3 { d8 c bes } g f g2 ~
  g2 \times 2/3 { r4 d' f } | \times 2/3 { a8 g f } d c d2 ~
  d2 \times 2/3 { r4 g, bes } | \times 2/3 { d8 c bes } g f g2 ~
  g2\times 2/3 { r4 d f } \times 2/3 { a8 g f } d c ~ c2
  \bar "||" \break 
  \A r8 g'4-^ bes8 b d e d | g4. b8 r2 |
  r8 g,4-^ bes8 b d e d | g4. e8 r2 \break
  r8 g,4-^ bes8 b d e d | 
  e' bes4. g4-^ r8 g-. bes b-. bes-. b-. \times 2/3 { g16 a g } f8 d c  
  \toCoda
  \times 2/3 { d8 c bes } g f g4 r4  \bar "||" \break  
  \Coda
  \times 2/3 { d'8 c bes } g f \times 2/3 { g4 g' bes }
  \times 2/3 { d8 c bes } g f g2 ~ | g \times 2/3 { r4 d f } | 
  \times 2/3 { a8 g f } d c d2 ~ | d1 
}

VoicingChorus = \relative c''' { 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold \box "Voicing Chorus"
  \repeat volta 2 {
    \repeat percent 4 { r8 g4.->~g4 g-- | g4.-^g8-^ r2 }
  } \break
  r8 <e bes'>4.->~<e bes'>4 <e bes'>-- | <e bes'>4.-^ <e bes'>8-^ r2 |
  r8 <d as'>4.->~<d as'>4 <d as'>-- | <d as'>4.-^ <d as'>8-^ r2
  r8 <e bes'>4.->~<e bes'>4 <e bes'>-- | <d as'>4.-^ <d as'>8-^ r2 |
  r8 <cis g'>4.->~<cis g'>4 <cis g'>-- | <c ges'>4.-^ <c ges'>8-^ r2 | \break
  \repeat percent 4 { r8 g'4.->~g4 g-- | g4.-^g8-^ r2 } \bar "|."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #-8
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  \partial 4. a4. | 8 s4. s2 | s2 r8 4. | 8 s4. s2 | s2 r8 4. | 
  8 s4. s2 | s2 r8 4. | 8 s4. s2 | s2 r8 4. | s1
  s1*7 |s2 s8 4. | 
  8 s4. s2 | s2 r8 4. | 8 s4. s2 | s2 r8 4. | 
  8 s4. s2 | s2 r8 4. | 8 s4. s2 |  s1
  s1 s2 \times 2/3 { r4 4 4 } |   4. 8 ~ 4 4 | 
  r2 \times 2/3 { r4 4 4 } | 4. 8 ~ 2
  
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
%   s1 ^\markup \bold \box \fontsize #7 A s1*7 
%   s1 ^\markup \bold \box \fontsize #7 B s1*7 
%   s1 ^\markup \bold \box \fontsize #7 A
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
          \theNotes \\ \chordsRhythm
        >> 
      >>
    }    
    \score {
      <<
        \new ChordNames{ \transpose c a \hChorus }
        \new Staff \transpose c a, \VoicingChorus
      >>
      \layout { indent = #0 }
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
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \\ \chordsRhythm
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames{ \transpose c a \hChorus }
        \new Staff \transpose c a, \VoicingChorus
      >>
      \layout { indent = #0 }
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes \\ \chordsRhythm
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames{ \transpose c a \hChorus }
        \new Staff \transpose c a, \VoicingChorus
      >>
      \layout { indent = #0 }
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
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes \\ \chordsRhythm
        >> 
      >>
    }
        \score {
      <<
        \new ChordNames{ \hChorus }
        \new Staff \VoicingChorus
      >>
      \layout { indent = #0 }
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
          \transpose c d \theNotes \\ \chordsRhythm
        >> 
      >>
    }
        \score {
      <<
        \new ChordNames{ \transpose c d \hChorus }
        \new Staff \transpose c d \VoicingChorus
      >>
      \layout { indent = #0 }
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a, \theNotes \\ \chordsRhythm
        >> 
      >>
    } 
        \score {
      <<
        \new ChordNames{ \transpose c a \hChorus }
        \new Staff \transpose c a, \VoicingChorus
      >>
      \layout { indent = #0 }
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