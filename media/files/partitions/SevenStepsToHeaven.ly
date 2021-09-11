
\version "2.19.80"
#(set-global-staff-size 18)
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
  ragged-last = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Seven Steps To Heaven"
composer = #"Miles Davis & V. Feldman"
meter = #"(Up Tempo Swing)"
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
  asplayed = #"Miles Davis" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=uKpK8RbGlO4"
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
}




harmonies = \chordmode {
  \set chordChanges = ##f
  %f1:7 es:7 f:7 es:7 
  f2:7 b:m5-7 e:m5-7 a:9+ d:m7 as4.:7 g8:7 s1  \startParenthesis \parenthesize g:m7 \endParenthesis \parenthesize  c:7 es1*2:7
  c1:7+ d2:m7 g:7 e4:m7 \parenthesize c2.:7+
  f2:m7 bes:7 es1:7+ as2:m7 des:7 ges1:7+ g2:m7 c:7
  f2:7 b:m5-7 e:m5-7 a:9+ d:m7 as4.:7 g8:7 s1 \startParenthesis \parenthesize g:m7 \endParenthesis \parenthesize  c:7 es2..:6.9 f8:6 s1
  %f1:7 es:7 f:7 es:7 f:7 es:7 f:7+ f:7+
}

IntroG = \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \override TextSpanner.bound-details.left.text = "Chords top notes"
  \partial 8 r8
  
  \repeat percent 3 { r4 \startTextSpan c r8 c r4 | r4 c r8 c r4 \stopTextSpan } c r r2 | R1 \bar "||"
}

IntroB = \relative c {
  \clef "bass" \key f \major \time 4/4
  \partial 8 c8
  \repeat percent 3 { f,4 c' r4. bes8 | es,4 bes' r4. c8 } c4 r r2 | R1
}

IntroH = \chordmode {
  \set chordChanges = ##f
  s8 f1:7+ es:6 s1*4 f1:7+
}

theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \override TextSpanner.bound-details.left.text = "Drum Fill"
  \textSpannerDown
  \showStartRepeatBar \bar "[|:"
  %   \Intro
  %   \repeat volta 2  \comp #16 \bar ":|][|:" \break
  \repeat volta 2 
  { \A c4 r f, r | a r g r | f2 f4. f8 | R1*2 \startTextSpan R1 \stopTextSpan | f2 f4. f8 | R1 }
  \break
  \B b,8 c d e ~ e f g a ~ | a4 g8 f e4 d8 g ~ | g1 ~ | 
  g2 r8 e f bes ~ | bes1 | bes2 r8 g as des ~ | des1 | R \bar "||" \break
  \A c4 r f, r | a r g r | f2 f4. f8 | R1*2 \startTextSpan R1 \stopTextSpan  | f2 f4. f8 | R1 \bar "||" \break
  %   \mark \markup \bold \box "Interlude"
  %   \comp #32
  \bar "|."
}

VoiceTwo =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  %\comp #16
  e4 r a, r | d r cis r | d2 c4. b8 | R1*3 | c2 cis4. d8 | R1 
  s1 | s1 | s1 | 
  g2 r8 e f f ~ | f1 | bes2 r8 e, f as ~ | as1 | R 
  e4 r a, r | d r cis r | d2 c4. b8 | R1*3 | c2 cis4. d8 | R1
  %\comp #32
}


grille = \chordmode {
  \bar "[|:"
  f1:7+ es:6 \set Score.repeatCommands = #'((volta "1"))
  f1:7+ es:6
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2")) \/f2:7+ r2 r1 
  \set Score.repeatCommands = #'((volta #f)) \break
  \/f2:7 b:m5-7 \/e:m5-7 a:9+ \/d:m7 as:7 g1:7 \break
  g:m7 c:7 \repeat percent 2 es:7 \break
  c1:7+ \/d2:m7 g:7 e1:m7 \/f2:m7 bes:7 \break
  es1:7+ \/as2:m7 des:7 ges1:7+ \/g2:m7 c:7 \break
  \/f2:7 b:m5-7 \/e:m5-7 a:9+ \/d:m7 as:7 g1:7 \break
  g:m7 c:7 es:7 \parenthesize f:7+ 
  
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 "Intro / Interlude" s1*7 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \partcombine \theNotes \VoiceTwo
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d { \partcombine \theNotes \VoiceTwo } 
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a { \partcombine \theNotes \VoiceTwo } 
      >> >>
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
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \partcombine \theNotes \VoiceTwo
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } 
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
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d { \partcombine \theNotes \VoiceTwo } 
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } 
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
        \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
        <<
          \new Staff \IntroG
          \new ChordNames { \IntroH }
          \new Staff \IntroB
        >>
      >>
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice  \transpose c a { \partcombine \theNotes \VoiceTwo } 
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } 
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