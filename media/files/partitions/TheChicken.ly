
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
  score-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 10)
                            (padding . 1))
}

title = #"The Chicken"
composer = #"Pee Wee Ellis"
meter = #"(Medium Funk)"
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
  s4 bes1*4:7 es1*2:7 d1:7 g:7 c1*3:7 r1 bes:7
}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4 g8 bes
  \repeat volta 2 {
    d4-> r2. | r4 f,16 g bes des~ des8 c16 bes c8 es |
    d4-> r2. | r4 d g8-- f-. des-. c->~ | \break
    c4 bes16 g bes8~ \< bes2~ | bes2. bes'4 \! | 
    r4 a8 a r4 a16 g f g~ | 
    g2~ g8. f,16 g bes d bes~ | \break
    bes2~ bes8. f16 g bes d bes~ | 
    bes2~ bes8. f16 g bes d bes~  | 
    bes2.\< r4 \! | bes'16 as8 f-. es-. des-. bes16 as8 r bes'-> 
    _\markup \italic \larger \bold \with-color #(x11-color 'red) "fine" \break \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \with-color #(x11-color 'red) "1st x only"
    r4 
    d,16[ d8 des16]~ des2 | 
    r4 d16[ d8 des16]~ des2 |
    r4 d16[ d8 des16]~ des2 | 
    r4 d16[ d8 des16]~ des4  g,8 bes | 
} }

VoiceTwo =  \relative c' {
  %\set Staff.instrumentName = "Voix 2"

  \clef "treble_8" \key bes \major \time 4/4
  \partial 4 g8 bes
  \repeat volta 2 {
    d4-> r2. | r4 f,16 g bes des~ des8 c16 bes c8 g |
    f4-> r2. | r4 f bes8-- as-. e-. es->~ | \break
    es4 des16 bes des8~ \< des2~ | des2. \! bes'4 | 
    R1 | 
    r4 \tuplet 3/2 { bes8 c cis } d4 r
    \break
    r4 e,16 e dis e~ e8. r16 r4 | 
    r4 e16 e dis e~ e8. r16 r4 |
    R1 |  bes'16 as8 f-. es-. des-. bes16 as8 r bes'-> 
    %_\markup \italic \larger \bold \with-color #(x11-color 'red) "fine" \break
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \with-color #(x11-color 'red) "1st x only"
    r4 
    as16 as8 g16~ g4 bes8 g | 
    bes r as16 as8 g16~ g4 bes8 g |
    bes r as16 as8 g16~ g4 bes8 g | 
    bes r as16 as8 g16~ g4  g8 bes | 
  }
}
Basse =  \relative c {
  \clef "bass" \key bes \major \time 4/4
  \partial 4 r4
  \repeat volta 2 {
    \repeat percent 3 { bes8[ r16 bes] d[ d r f] r f[ r f] g8 bes }
    bes,8[ r16 bes] d[ d r f] r f[ r f] g8 es~ | \break
    es8[ r16 es] g[ g r bes] r bes[ r bes] c8 es |
    es,8[ r16 es] g[ g r bes] r bes[ r bes] a,8 cis | \break
    d8[ r16 d] fis[ fis r a] r a[ r a] b8 d |
    g,,8[ r16 g] b[ b r d] r d[ r d] e8 g | \break
    \repeat percent 3 { c,8[ r16 c] e[ e r g] r g[ r g] a8 c }
    bes16 as8 f-. es-. des-. bes16 as8 r bes~ 
        _\markup \italic \larger \bold \with-color #(x11-color 'red) "fine" \break \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \with-color #(x11-color 'red) "1st x only"

    \repeat percent 4 { bes8[ r16 bes] d[ d r f] r[ f r f] g8 bes }
  }
}

IntroB =  \relative c {
  \set Staff.instrumentName = \markup {
    \center-column { "Basse"
                     \line { "line" }
  } }
  \clef "bass" \key bes \major \time 4/4
  \repeat percent 3 { bes8[ r16 bes] d[ d r f] r f[ r f] g8 bes }
  bes,8[ r16 bes] d[ d r f] r f[ r f] g8 es~ | 
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
\once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
  \mark \markup "Bass cont. simile"
}

grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 bes1:7 \break
 \repeat percent 2 es:7 d:7 g:7
 \repeat percent 3 c:7 r1
  \bar ":|]" }

marques = \relative c' { 
  
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \partcombine \theNotes \VoiceTwo
        >> 
      >>
    } 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \Basse
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
  \bookpart {
    \score {
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } 
        <<
          \transpose c d  { \partcombine \theNotes \VoiceTwo }
        >> 
      >>
    }
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
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } 
        <<
          \transpose c a  { \partcombine \theNotes \VoiceTwo }
        >> 
      >>
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
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \partcombine \theNotes \VoiceTwo
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
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \Basse
        >> 
      >>
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
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } 
        <<
          \transpose c d  { \partcombine \theNotes \VoiceTwo }
        >> 
      >>
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
      \new Staff \IntroB 
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } 
        <<
          \transpose c a  { \partcombine \theNotes \VoiceTwo }
        >> 
      >>
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