
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

title = #"Sky Dive"
composer = #"Freddie Hubbard"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"

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
  asplayed = #"Freddie Hubbard" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=G2zJnSOWS20"
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
  \column { \line { \with-color #red \fontsize #2 "2nd voice next page" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s4 g1*2:m9 c:m/f g:m9 des:5-7+
  g1:m11 des2:11+ c:m11 ges1:5-7+ e:5-7+
  s8 a4:7+11+ bes:6 b:6 c8:7sus4 s1 bes2:m11 c2*3:m11
  bes2:m11 c2*3:m11 bes2:m11 c2*3:m11
  c1:m11 a1:m11 s c1:m7 f:7 a1:m11 s c1:m7 f:9-
  bes1*2:m7+ as:m7+ 
  ges1:5-7+ e:5-7+ d:5-7+ c:5-7+
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \set Score.markFormatter = #format-mark-box-alphabet
  \partial 4 a4
  \set Score.repeatCommands = #'(start-repeat)
  \mark #1
  a4. f8~ f2~ | f~ f8 a4 f8 |
  g1~ | g2. a8 bes |
  a4. f8~ f2~ | f~ f8 a4 f8 |
  c'1~ | c2 r4 c4 \break
  c4. f,8~ f2~ | f2. c'16 des c bes |
  c2. des8 bes~ | bes2. c4 |
  r8 as r g r as r f~ | f2 r4 c8 r | \break
  es4. f8~ f2~ | f2. c8 r |
  es4. f8~ f2~ | f2. c8 r |
  es4. f8~ f2~ | 
  \set Score.repeatCommands = #'((volta "1"))
  { f2. a4 }
  \set Score.repeatCommands = #'((volta #f) (volta "2, 3") end-repeat)
  { f1 \repeatTie  \set Score.repeatCommands = #'((volta #f)) 
    \bar "||" \break
    \mark #2
    d'8 d8 d4 r2 | r8 b4 a8~ a g4 d8 | 
    bes'2.~ bes8 g16 bes | a2.. d,8
    d'8 d8 d4 r2 | r8 b4 a8~ a g4 d8 | 
    bes'2~ bes8 a16 bes b c des d |es8 a,~ a2~ a8 f16 g | \break
    a1~ | a2.. a16 bes |
    g1~ | g2. r8 as | f2~ f4 fis8 dis~ | dis2~ dis4 e8 cis~| 
    cis2~ cis4 d!8 b~ | b2. a'4
  } \set Score.repeatCommands = #'((volta #f) end-repeat)
}

VoiceTwo =  \relative c' {
  \clef "treble_8" \key bes \major \time 4/4
  \set Score.markFormatter = #format-mark-box-alphabet
  \override ParenthesesItem.font-size = #6
  \partial 4 d4
  \set Score.repeatCommands = #'(start-repeat)
  \mark #1
  d4. bes8~ bes2~ | bes~ bes8 d4 bes8 |
  es1~ | es2. d4 |
  d4. bes8~ bes2~ | bes~ bes8 d4 bes8 |
  g'1~ | g2 r2 | \break
  % voix1 
  c,4. f,8~ f2~ | f2. c'16 des c bes |
  c2. des8 bes~ | bes2. c4 |
  %
  r8 es r d r es r c8~ | c2 r4 f,8 r | \break
  bes4. c8~ c2~ | c2. f,8 r | 
  bes4. c8~ c2~ | c2. f,8 r | 
  bes4. c8~ c2~ | 
  \set Score.repeatCommands = #'((volta "1"))
  c2. d4 | 
  \set Score.repeatCommands = #'((volta #f) (volta "2, 3") end-repeat)
  c1 \repeatTie 
  \set Score.repeatCommands = #'((volta #f)) 
  \bar "||" \break
  % voix 1
  \mark #2 
  d4 d8 d r2 | r8 b4 a8~ a g4 d8 | 
  bes'2.~ bes8 g16 bes | a2.. d,8
  d'4 d8 d r2 | r8 b4 a8~ a g4 d8 | 
  bes'2~ bes8 a16 bes b c des d |es8 a,~ a2~ a8 f16 g |
  %
  \break
  f'2~ f8 es16 f es4 | des16 es des8~ des c16 des~ des2 |
  r8 es16 f es4 des16 es des8~ des ces16 des |
  ces4 bes16 ces bes8~ bes2 | \break
  r4. <bes deses>8~ q2 | r4. < gis bes!>8~ q2 | r4. <fis as>8~ q2 | r4. <e ges>8~ q2
  \set Score.repeatCommands = #'((volta #f) end-repeat)
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  s4 s1*10 r8 d8 8 8~ 2 r8 d8 8 8~ 2 s1*21 \repeat unfold 4 { r8 d8 8 8~ 2 }
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 \repeat percent 2 g1:m9 \repeat percent 2 c:m/f \break
 \repeat percent 2 g1:m9 \repeat percent 2 des:5-7+ \break
 g:m11 \/des2:11+ c:m11 ges1:5-7+ e:5-7+ \break
 \x a4:7+11+ bes:6 b:6 c:7sus4 c1:7sus4 \/bes2:m11 c:m11 c1:m11 \break
 \/bes2:m11 c:m11 c1:m11 \/bes2:m11 c:m11 c1:m11  \break \bar ":|]"
 \repeat percent 2 a:m11 c:m7 f:7 \break
 \repeat percent 2 a:m11 c:m7 f:9- \break
 \repeat percent 2 bes:m7+ \repeat percent 2 as:m7+ \break
 ges:5-7+ e:5-7+ d:5-7+ c:5-7+ \break
 \repeat percent 2 g1:m9 \repeat percent 2 c:m/f \break
 \repeat percent 2 g1:m9 \repeat percent 2 des:5-7+ \break
 g:m11 \/des2:11+ c:m11 ges1:5-7+ e:5-7+ \break
 \x a4:7+11+ bes:6 b:6 c:7sus4 c1:7sus4 \/bes2:m11 c:m11 c1:m11 \break
 \/bes2:m11 c:m11 c1:m11 \/bes2:m11 c:m11 c1:m11  
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 A s1*19
  s1 ^\markup \bold \box \fontsize #5 B s1*15
  s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  \header { meter = \CleSol }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \theNotes
        >> 
      >>
    } \form
  } \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \VoiceTwo
        >> 
      >>
}  }  }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  \header { meter = \Bb }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \transpose c d \theNotes
        >> 
      >>
    } \form
  } \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \VoiceTwo
        >> 
      >>
}  }  }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  \header { meter = \Eb }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \transpose c a \theNotes
        >> 
      >>
    } \form
  } \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \VoiceTwo
        >> 
      >>
}  }  }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \header { meter = \CleSol }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \theNotes
        >> 
      >>
    } %\form
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \VoiceTwo
        >> 
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
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \transpose c d \theNotes
        >> 
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \VoiceTwo
        >> 
      >>
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
        \new Staff \with { instrumentName = "1st Voice" } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \chordsRhythm \\ \transpose c a \theNotes
        >> 
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup {
          \center-column { "2nd voice" \line { "octave lower" } } } }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \VoiceTwo
        >> 
      >>
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