
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
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Are You Real?"
composer = #"Benny Golson"
meter = #"(Up Swing)"
kwtempo = #"Fast"
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
  asplayed = #"The Jazz Messenger" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=i6KN0S-dGJE"
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
    \override Glissando.style = #'zigzag
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
  d2:m7 g:9- c1:m7 f:7 bes:7+ es:7+
  a:m5-7 d:9+ g:m5-7 c:9-
  fis2:m7 b:7 f:m7 bes:7 d:m7 g:7 des2:7 c:7
  f1:m7 bes:7 es:7+ d2:m5-7 g:9-
  f1:m7 bes2:7 bes:7/as g1:m5-7 c:9+ fis2:m7 b:7 f:m7 bes:7 es1*2:6
  f1:m7 b2:5+7 bes:7 es1:7+9
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  c2 d 
  \repeat volta 2 {
    es1 ~ 
    es2 d4-^ c8( d) ~ 
    d1 ~ 
    d2. bes4 
    c4-- c4-- c4-- c4--
    c d c-^ a8 bes ~ \break
    bes1 ~
    bes2 f4 g 
    as2 as ~
    as es4 f8 g ~
    g1 ~
    g2 r4 es \break
  }
  \alternative {
    { 
      f2 f 
      f4 g es f8 g ~
      g1
      c2 d  \break
    }
    { 
      f,2 f 
      f4 g8 es r8 f4.-^  
    }
  } 
  g2 g g4 as8 f-. r8 g4.-^ \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \Coda
  as2. c,4
  \override TextSpanner.bound-details.left.text = "solo break"
  \textSpannerDown
  g'2  g es4 \startTextSpan r r2
  R1 \stopTextSpan \bar "|." \break
  \Coda as2. c4 | es2 d \glissando | f1 \fermata
  \bar ".."
}

voiceII =  \relative c''' {
  \clef "treble" \key es \major \time 4/4
  \override TextSpanner.bound-details.left.text = "8vb"
  \textSpannerDown
  a2\startTextSpan as 
  \repeat volta 2 {
    g2 \stopTextSpan bes4-. g8 a8~ | 1~ | 2 4-. f8 g8~ | 2 r4 bes |
    a as as g | ges2 a4-. fis8 g8~ | \break
    4 a8 as r g ges f | e2 f,4 g
    as2 as ~
    as es4 f8 g ~
    g1 ~
    g2 r4 es \break
  }
  \alternative {
    { 
      f2 f 
      f4 g es f8 g ~
      g1
      a'2 as  \break
    }
    { 
      f,2 f 
      f4 g8 es r8 f4.-^  
    }
  } 
  des'2 \glissando f | e4 f8 d r e4. |   
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \Coda \break
  e2. r4 | a,2 as | g4 r r2 | R1
 \break \Coda
  es'2. r4 | as,2 bes \glissando | d1 \fermata
  \bar ".."
}


chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
  c1:m7 f:7 bes:7+ es:7+ \break
  a:m5-7 d:9+ g:m5-7 c:9- \break
  \/fis2:m7 b:7 \/ f:m7 bes:7 \/d:m7 g:7 \/des:7 c:7 \break
  \set Score.repeatCommands = #'((volta "1"))
  f1:m7 bes:7 es:7+ \/d2:m5-7 g:9- \break
  \set Score.repeatCommands = #'((volta "2") end-repeat)
  f1:m7 \set Score.repeatCommands = #'((volta #f))
  \/bes2:7 bes/as g1:m5-7 c:9+ \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \Coda
  
  \/fis2:m7 b:7 \/f:m7 bes:7 \repeat percent 2 es1:6 \bar "|." \break
  \Coda
  f1:m7 \/b2:5+7 bes:7 es1:6 \fermata \bar ".."  
  \stopStaff s1 \bar "" }

marques = \relative c' { 
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 1" " (2ème voix page suivante)" } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
      >>
    }
  } \bookpart {
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 2" " (1ère voix page précédante)" } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \voiceII
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
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 1" " (2ème voix page suivante)" } }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
      >>
    }
  } \bookpart {
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 2" " (1ère voix page précédante)" } }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } \transpose c d \voiceII
      >>
    } 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 1" " (2ème voix page suivante)" } }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
      >>
    }
  } \bookpart {
    \header { meter = \markup { \fontsize #2 \with-color #red "Voix 2" " (1ère voix page précédante)" } }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a, \voiceII
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
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \voiceII
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
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } \transpose c d \theNotes
        \new Staff \transpose c d \voiceII
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
        \new Staff  \transpose c a, \voiceII
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