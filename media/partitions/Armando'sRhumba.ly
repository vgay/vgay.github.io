
\version "2.22.0"
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
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Armando'sRhumba"
composer = #"Chick Corea"
meter = #"(Bright Rhumba)"
kwtempo = #"Fast"
kwstyle = #"Rhumba"

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
  asplayed = #"Chick Corea" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=Diregu6eFzk"
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
 
  \column { \line {  { "1st theme on ABAB - Solos on ABABCB - During Solos" \box C "is played as written" - "Last theme on ABCB (coda)" }  } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  r1*5 
  c1:m7 d:9- g:7.13- c:m7
  c1:m7 d:9- g:7.13- c:m7
  c:9- f:m7 d:9-/fis g:m7
  as:dim7 d:7/a bes:7sus4 s
  as:m/bes s2 g4.:7 c8:m7 s4. e8:7 f4:7 fis g1:7.13-
  c1:m7 d:9- g:7.13- c:m7
  c1:m7 d:9- g:7.13- c:m7
}
hcoda = \chordmode {
  \set chordChanges = ##t
  s4. e8:7 f4:7 fis g2.:7.13- c4:m
}

theNotes =  \relative c'' {
  \key es \major \time 2/2
  \override Rest #'staff-position = #0

  \mark \markup { \bold \box Intro \fontsize #-1 (unisson)}
  c8 des4 b8 c des4 b8 | c4. g8~ 4 es'8 c |
  g4 c8 g es4 g8 es | c4 r r c'-> | c4.-> 8->~ 2 
  \break \A \bar "||-[|:"
  \repeat volta 2 {
    r8 g c es g4 es | fis4. d8~ 2 |
    \tuplet 3/2 { r4 f! d } f8 d4 es8~ | \tuplet 3/2 { es4 as, g } es' r 
    r8 g, c es g4 es | fis4. d8~ 2 |
    \tuplet 3/2 { r4 f! es } d8 f4 es8~ | 4. c8~ 2 \break
    \BetS g4 e8 g bes as4 g8 | as4. g8 as4. a8~ |
    4. fis8~ 8 c'4 a8 | bes8 a bes c d4 r | 
    b4. c8 \tuplet 3/2 { d4 c b } | c8 b4 c8~ 8 d4 es8~ |
    es4. bes8~ 2~ | 4. g8 fis4 g |
    bes!8 as4 b8~ 4. f8 | as f es b <d g>4. <bes es>8 |
    %\tweak self-alignment-X #RIGHT
    \mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" "last x  " } }

    r4 r8 as' a4 bes | 
    \once \override Score.RehearsalMark #'direction = #DOWN
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \once \override Score.RehearsalMark.extra-offset = #'(12 . 0)
    \mark \markup \with-color #red "To solos 1st x"
    
    b4. <es g>8~ q2
  } \break
  \doubleMark
  \markup \with-color #red fine
  \markup { \bold \box \fontsize #2 C "(unisson)" }
  r8 c, es g c es4 g8 | a4. fis8~ 4 g8 fis |
  f! e4 es8 \tuplet 3/2 { d4 b as } | g4. es8~ 4 c 
  r4 r8 g'8 c,4 es8 g | fis4. d8~ 4 f4 ~|
  f8 d es f g as4 b8 | c4-> r8 c'-> 4-> r \bar ".."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "D.S. al fine"
}

ending = \relative c' { \Coda
                        r4 r8 as' a4 bes | b4. <es g>8~ q4 c | r2 r4 <c c'>-^ \bar ".."
}

grille = \chordmode {
  \bar "[|:"
 c1:m7 d:9- g:7.13- c:m7 \break
 c1:m7 d:9- g:7.13- c:m7 \break \bar "||"
 c:9- f:m7 d:9- g:m7 \break
 as:dim7 d:7/a \repeat percent 2 bes:7sus4 \break
 as:m/bes \/as2:m/bes g:7 \x c4:m7 e:7 f:7 fis g1:7.13-
 \bar ":|]" }
 

marques = \relative c' { 
    s1 ^\markup \bold \box \fontsize #7 A s1*7 
    s1 ^\markup \bold \box \fontsize #7 B 
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
    } \form
    \score {
      <<
        \new ChordNames { \hcoda }
        \new Staff << \ending >>
      >>
      \layout { indent = 0 }
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
          \transpose c d \theNotes
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \transpose c d \hcoda }
        \new Staff << \transpose c d \ending >>
      >>
      \layout { indent = 0 }
} } }

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
          \transpose c a, \theNotes
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \transpose c a \transpose c d \hcoda }
        \new Staff << \transpose c a, \transpose c d \ending >>
      >>
      \layout { indent = 0 }
} } }

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
          << { \theNotes } \\ { s1*9 \break s1*8 \break s1*4 \break s1*4 \break s1*4 \break  } >>
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \hcoda }
        \new Staff << \ending >>
      >>
      \layout { indent = 0 }
    }
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
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          << { \transpose c d \theNotes } \\ { s1*9 \break s1*8 \break s1*4 \break s1*4 \break s1*4 \break  } >>
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \transpose c d \hcoda }
        \new Staff << \transpose c d \ending >>
      >>
      \layout { indent = 0 }
    }    }  \bookpart {
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
          << { \transpose c a, \theNotes } \\ { s1*9 \break s1*8 \break s1*4 \break s1*4 \break s1*4 \break  } >>
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \transpose c a \hcoda }
        \new Staff << \transpose c a, \ending >>
      >>
      \layout { indent = 0 }
    }
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

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bass")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } <<
          %\new Voice  
          << { \clef "bass" \transpose c c, \theNotes } \\ { s1*9 \break s1*8 \break s1*4 \break s1*4 \break s1*4 \break  } >>
        >> 
      >>
    } \form
    \score {
      <<
        \new ChordNames { \hcoda }
        \new Staff << \clef "bass" \transpose c c,\ending >>
      >>
      \layout { indent = 0 }
    }
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

