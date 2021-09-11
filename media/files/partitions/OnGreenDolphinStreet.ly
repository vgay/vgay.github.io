
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
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"On Green Dolphin Street"
composer = #"Bronislau Kaper"
meter = #"(Med. Up Latin / Swing)"
kwtempo = #"Med. Up"
kwstyle = #"Latin / Swing"


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


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##t
es1*2:7+ es:m7 f1:7+/es e:7+/es es1:7+ g2:m7 c2:7
  f1:m7 bes2:9sus4 bes:5+7.9-11+ es1*2:7+
  as1:m7 des2:9sus4 des:5+7.9-11+ ges1:7+ f2:m7 bes:7
  f2:m7 f:m/es d:m5-7 g:9- c:m7 c:m/bes f2:7 fis:dim 
  g:m7 c:7 f4.:5+7.9-11+ bes:13 bes:7/as 
  es1:6.9 \startParenthesis \parenthesize  f2:m7  \endParenthesis \parenthesize bes:7
}

harmoniesAlt = \chordmode {
  \set chordChanges = ##t
s1*6 \startParenthesis \parenthesize es2:7+ as:9 \endParenthesis \parenthesize  g:5+7.9-11+ s
s1*2\startParenthesis \parenthesize  bes1:m7 \endParenthesis \parenthesize  es:7
s1*7 \startParenthesis \parenthesize a2:m5-7 \endParenthesis \parenthesize  d:7
}

Rythme=  \relative c''' {
  \improvisationOn
  \override NoteHead.no-ledgers = ##t
  \override Rest #'staff-position = #6

  s1*20
  r8 e r4 2 | 4. 8~ 4 4 |
  r8 8 r4 2 | 2 2
}

theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
    \showStartRepeatBar \bar "[|:"
\override Rest #'staff-position = #0

  \repeat volta 2 {
    \mark \markup \bold \box "Latin"
    es2 es ~ | es \times 2/3 { d4 bes g } | des'1 ~ | des 
    c2 c ~ | c \times 2/3 { b4 gis e } | bes'!1 ~ | bes \bar "||" \break
  }
  \alternative {
    { \mark \markup \bold \box "Swing"
      bes2 f4 g | as bes b des | bes2 bes ~ | bes2. bes4
      des as2 bes4 | ces des d4. e8 | des2 des ~ | des d \break }
    { \mark \markup \bold \box "Swing" bes2 f4 g }
  }
     as bes b g' | \noBreak f2 es | \noBreak es,4 f fis d' | \noBreak
     \voiceTwo c2 bes \noBreak | r4. d8 ~ d4 c-.\noBreak
      bes-. bes2. \noBreak | r1
    \bar ".."
}

voltaTillCue =  \markup { \text \large \italic { till cue (solos) } }
voltaOnCue = \markup { \text \large \italic { On Cue } }

grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 es1:7+ \repeat percent 2 es:m7 \break
  f:7+/es e:7+/es es:7+ \/g2:m7 c:7 \bar "||"  \break
  \set Score.repeatCommands = #'((volta "1"))
  f1:m7 \set Score.repeatCommands = #'((volta #f)) bes:8 es:7+ \parenthesize es:7 \break
  as:m7 des:8 ges:7+ \/f2:m7 bes:7 \bar ":|]"  \break
  \set Score.repeatCommands = #'((volta "2"))
  \/ f:m7 f:m/es \set Score.repeatCommands = #'((volta #f)) \/d2:m5-7 g:9- 
  \/c:m7 c:m/bes \/f2:7 fis:dim7 \break
  
  \/g:m7 c:7 \/f:m7 bes:7 es1:7+ \/f2:m7 bes:7 
\bar "||"
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 Latin s1*7 
  s1 ^\markup \bold \box \fontsize #5 Swing s1*7 
  s1 ^\markup \bold \box \fontsize #5 Swing
}

message = \markup "Intro et Coda éventuelles sur la la partie latine. Solo sur les parties latines et swing."


verse = \lyricmode {
  Lo -- ver, one love -- ly day
Love came plan -- ning to stay
Green Dol -- phin Street sup -- plied the set -- ting
The set -- ting for nights bey -- ond for -- get -- ting and

When I re -- call the love I found on
I could kiss the ground on Green Dol -- phin Street
% 
% Lover, one lovely day
% A love came planning to stay
% Green Dolphin Street supplied the setting
% The setting for nights beyond forgetting
% 
% And through these moments apart
% Love come here in my heart
% When I recall the love I found on
% I'm gonna kiss the ground I found on Green Dolphin Street

}
verseB = \lyricmode {
  Through these mo -- ments a -- part
 Love come here in my heart

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
        \new ChordNames \with { \override  ChordName.font-size = #-1 } \harmoniesAlt
        \new ChordNames \harmonies
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
           \Rythme \\ \theNotes
           \addlyrics \verse
          \addlyrics \verseB
     >> >>
} \message
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 } \transpose c d \harmoniesAlt
        \new ChordNames  \transpose c d \harmonies
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \Rythme \\ \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
} \message
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \override  ChordName.font-size = #-1 }  \transpose c a \harmoniesAlt
        \new ChordNames \transpose c a \harmonies
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \Rythme \\ \transpose c a, \theNotes
           \addlyrics \verse
          \addlyrics \verseB
      >> >>
} \message
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
        \new ChordNames \with { \override  ChordName.font-size = #-1 }  \harmoniesAlt
        \new ChordNames \harmonies
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Rythme \\
          \theNotes 
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
} \message
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
        \new ChordNames \with { \override  ChordName.font-size = #-1 }  \transpose c d \harmoniesAlt
        \new ChordNames\transpose c d \harmonies
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \Rythme \\ \transpose c d \theNotes
           \addlyrics \verse
          \addlyrics \verseB
      >> >>
} \message
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
        \new ChordNames \with { \override  ChordName.font-size = #-1 }  \transpose c a \harmoniesAlt
        \new ChordNames\transpose c a \harmonies
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \Rythme \\ \transpose c a, \theNotes
           \addlyrics \verse
          \addlyrics \verseB
      >> >>
} \message
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