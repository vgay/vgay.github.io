
\version "2.22.0"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"

CleSol= \markup { \circle \fontsize #-2 \bold \concat {" " \musicglyph "clefs.G_change" " "} "    " }

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

title = #"Work Song"
composer = #"Nat Adderley"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
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
  asplayed = #"Canonball Adderley" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=MmwsQ_dHrFM"
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
  \set chordChanges = ##t
  s4 f1:m7  \startParenthesis \parenthesize g2:m5-7 \endParenthesis \parenthesize  c:9+
  f1:m7  \startParenthesis \parenthesize g2:m5-7 \endParenthesis \parenthesize  c:9+
  f1:m7 f:m7 c4:7 \parenthesize c:9+ s1. 
  f1*4:m7 f1:7 bes:7 des2:7 c:5+7.9- f1:m7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4 r4
  \repeat volta 2 {
    r4 f8 f as bes4-. c8-> ~ | c4 c8 bes c4 es-.
    r4 f,8 f as bes4-. f8-> ~ | f4 f8 es f2 \break
    r4 f8 f as bes4-. c8-> ~ | c4 c8 bes c4 es-.
    r4 c8 c es c4-. e8-> ~ | e4 c8 bes c2 \break
    r4 f8.-. es16-. \times 2/3 { b8 bes as } bes as ~ | as4 as8 f as4 bes-.
    r4 f8 f as bes4-. f8-> ~ | f4 f8 es f es f4-. \break
    b8 c-> ~ c4 r f,-. | bes8( b->) ~ b4 r8 f as b-.~
    b bes4-. as8 bes8. as16 f es f8 ~ | f1
  }
}

voiceII=  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \once \override TextScript #'extra-offset = #'( 7 . 0.3 ) 
  \partial 4 r4 _\markup \fontsize #-1.5 "upper voice 1st x, lower voice 2nd x"
  R1*2 
  r4 << { %\once \override TextScript #'extra-offset = #'( -6 . -0.5 ) 
          f8 f as bes4-. f8-> ~ | f4 f8 es f2 } \\
        { %\once \override TextScript #'extra-offset = #'( -6 . 4 ) 
          c8  c es f4-. c8-> ~ | c4 c8 bes c2 } >>
  R1*2 
  r4 << { c'8 c es c4-. e8-> ~ | e4 c8 bes c2 } \\
        { g8 g bes g4-. b8-> ~ | b4 g8 f g2 } >>
  R1*2 
  r4 << { f8 f as bes4-.   } \\  { c,8 c es f4-.  } >>

  f8-> ~ | f4 f8 es f es f4
  b8 c-> ~ c4 r f,-. | bes8( b->) ~ b4 r8 f as b-.~
  b bes4-. as8 bes8. as16 f es f8 ~ | f1
}





chordsRhythm = \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4 r4
  f r4 r2 r r4 c | f r4 r2 r r4 c | f r4 r2 r r4 g | 
  c, r4 r2 r r4 c | 
  f r4 r2 r r4 c | f r4 r2 R1 |
r4. <c es f a >8~ q4 r | r4. <bes d f as>8~ q4. <b des f as >8~ | 
q2 <bes des e as >4. <c es f as >8~ q2. c4
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key es \major \time 4/4
  \partial 4 c4
  f r4 r2 r r4 c | f r4 r2 r r4 c | f r4 r2 r r4 g | 
  c, r4 r2 r r4 c | 
  f r4 r2 r r4 c | f r4 r2 R1 |
  r4. f8~ 4 r4 | r4. bes,8~ 4. des8~ | 2 c4. f8~ | 2. c4
}

grille = \chordmode {
  \bar "[|:"
 f1:m7 \/g2:m5-7 c:9+ f1:m7 \/g2:m5-7 c:9+ \break
 \repeat percent 2 f1:m7 \repeat percent 2 c:7 \break
 \repeat percent 4 f:m7 \break
 f:7 bes:7 \/des2:7 c:5+7.9- f1:m7
  \bar ".." }

marques = \relative c' { 
%   s1 ^\markup \bold \box \fontsize #7 A s1*7 
%   s1 ^\markup \bold \box \fontsize #7 B s1*7 
%   s1 ^\markup \bold \box \fontsize #7 A
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
      \new StaffGroup \with { instrumentName = \CleSol }
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \theNotes
        \new Staff \with { instrumentName = "            trp."  } \voiceII
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
      \new StaffGroup \with { instrumentName = \Bb }
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \transpose c d \theNotes
        \new Staff \with { instrumentName = "            trp."  } \transpose c d \voiceII
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
      \new StaffGroup \with { instrumentName = \Eb }
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \transpose c a \theNotes
        \new Staff \with { instrumentName = "            trp."  } \transpose c a \voiceII
      >>    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      \new StaffGroup \with { instrumentName = \CleSol }
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \theNotes
        \new Staff \with { instrumentName = "            trp."  } \voiceII
        \new Staff \with { instrumentName = "           Piano"  } \chordsRhythm
        \new Staff \with { instrumentName = "            bass"  } \Basse
      >>
    } %\form
    }  \bookpart {
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
      \new StaffGroup \with { instrumentName = \Bb }
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \transpose c d \theNotes
        \new Staff \with { instrumentName = "            trp."  } \transpose c d \voiceII
        \new Staff \with { instrumentName = "           Piano"  } \chordsRhythm
        \new Staff \with { instrumentName = "            bass"  } \Basse
      >>
    } %\form
    }  \bookpart {
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
      \new StaffGroup \with { instrumentName = \Eb }
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup \raise #2 "           alto" }
        \transpose c a \theNotes
        \new Staff \with { instrumentName = "            trp."  } \transpose c a \voiceII
        \new Staff \with { instrumentName = "           Piano"  } \chordsRhythm
        \new Staff \with { instrumentName = "            bass"  } \Basse
      >>
    } %\form
    }  \bookpart {
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