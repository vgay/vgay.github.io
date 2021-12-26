\version "2.22.0"
#(set-global-staff-size 17)
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

title = #"Friday Night At The Cadillac Club"
composer = #"Bob Berg"
meter = #"(Med. Up Shuffle)"
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
  asplayed = #"Bob Berg" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=yT3a4CM4qmQ"
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
  \set chordChanges = ##f
  c1:13 bes4.:13sus4 bes8:13 s2 c4.:13sus4 c8:13 s2 des4.:13sus4 des:13 c4:13sus4
  c1:13 bes4.:13sus4 bes8:13 s2 c4.:13sus4 c8:13 s2 ges4.:13sus4 ges:13 f4:13sus4
  f1:13 es4.:13sus4 es8:13 s2 d4.:13sus d8:13 s2 des4.:13sus4 des:13 c4:13sus4
  c1:13 b4.:13sus4 b8:13 s2 bes4.:13sus4 bes8:13 s2 a1:5+7.9-11+ f:7+/g s 
  as1.:5+7+ s8 g4:5+7.9-11+ c8:13 s1 bes4.:13sus4 bes8:13 s2 es4.:13sus4 es8:13 s2 
  des4.:13sus4 des:13 c4:13sus4
}


theNotes =  \relative c'' {
  \clef "treble" \time 4/4
  r8 c f-. g e4 c | es f8 d r2 | r8 c f-. g e4 c | ges'8 as f des ces es c c  
  r8 c f-. g e4 c | es8 cis d bes' r2 | r8 c, f-. g e4 c | 
  \times 2/3 { r8 bes c }  \times 2/3 { e ges bes } \times 2/3 { r8 e, ges } \times 2/3 { bes des c } \break
  r8 f, bes-. c a4 f | as bes8 g r4. g8~ | 
  \times 2/3 { g16 as g } fis8 g a fis4 d | ges8 as f des ces es c c  
  r8 c f-. g e4 c | e8 d dis b' r4. es,8~ |
  \times 2/3 { es16 f es } d8 es f d4 bes | r8 a cis e f a c! c~  \break |
  c4. d8 \times 2/3 { b a g~ } g4~ | \times 2/3 { g8 g a }  \times 2/3 { f e d~ } d4 r
  \times 2/3 { r8 bes g } \times 2/3 { as c e } \times 2/3 { g ges f } r4 |
  r \times 2/3 { bes8 a as } r es'-^ r c-^ |
  r8 c, f-. g e4 c | es f8 d r4. as'8~ | \times 2/3 { as16 bes as } g8 as bes g4 es
  ges8 as f des ces es c c 
  \bar ".."
}


IntroG = \relative c'' {
  \clef "treble" \time 4/4
  \new Voice \with { squashedPosition = #6 } {
  \override TextSpanner.bound-details.left.text = "Chords top notes"
  \override NoteHead.no-ledgers = ##t 
  \improvisationOn
  \partial 4 b8 b
  r4 r8 b r2 | b4. b8 r2 | b4. b8 r2 | b4. b8 r4 b8 b
} }

IntroB = \relative c' {
  \clef "bass"  \time 4/4
  \partial 4 c8 c
  \repeat volta 2 {
    r4 g, c b | bes8 bes e,4 f b | c g' g, c | bes f bes b
  }
}

IntroH = \chordmode {
  \set chordChanges = ##f
  c4:13sus4 s4. c8:13 s2 bes4.:13sus4 bes8:13 s2 c4.:13sus4 c8:13 s2bes4.:13sus4 bes8:13 s4 c4:13sus4
}

truc = ^\markup
    \with-dimensions #'(0 . 0) #'(-4.3 . 2)
    \path #0.1
          #'((moveto    15   -10.0)
            (lineto    31   -15.00)      
    )

grille = \chordmode {
  c1:13 \/bes2:13sus4 bes:13 \/c:13sus4 c:13 \wa des2:13sus4 des4:13 c:13sus4 \break
  c1:13 \/bes2:13sus4 bes:13 \/c:13sus4 c:13 \wa ges2:13sus4 ges4:13 f:13sus4 \break
  f1:13 \/es2:13sus4 es:13 \/d:13sus4 d:13 \wa des2:13sus4 des4:13 c:13sus4 \break
  c1:13 \/bes2:13sus4 bes:13 \/bes:13sus4 bes:13 a1:5+7.9-11+ \break
  \repeat percent 2 f:7+/g as1:5+7+ \/as2:5+7+ g:5+7.9-11+  \break
  c1:13 \/bes2:13sus4 bes:13 \/es2:13sus4 es:13 \wa des2:13sus4 des4:13 c:13sus4 
  \bar ".." }

marques = \relative c' { 
  s1*3 s1 \truc
  s1*3 s1 \truc
  s1*3 s1 \truc
  s1*11 s1 \truc
      
 
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    %     \score {
    %       <<
    %         \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
    %         <<
    %           \new Staff \IntroG
    %           \new ChordNames { \IntroH }
    %           \new Staff \IntroB
    %         >>
    %       >>
    %     }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    %     \score {
    %       <<
    %         \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
    %         <<
    %           \new Staff \IntroG
    %           \new ChordNames { \IntroH }
    %           \new Staff \IntroB
    %         >>
    %       >>
    %     }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    %     \score {
    %       <<
    %         \new PianoStaff \with { instrumentName = \markup { \center-column { "Intro" \line { "Interlude" } } } }
    %         <<
    %           \new Staff \IntroG
    %           \new ChordNames { \IntroH }
    %           \new Staff \IntroB
    %         >>
    %       >>
    %     }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a, \theNotes
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
        \new PianoStaff \with { instrumentName = Intro }
        <<
          \new ChordNames { \IntroH }
         \new Staff \IntroG
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
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
        \new PianoStaff \with { instrumentName = Intro }
        <<
          \new ChordNames { \IntroH }
          \new Staff \IntroG
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
          \transpose c d \theNotes
      >> >>

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
        \new PianoStaff \with { instrumentName = Intro }
        <<
          \new ChordNames { \IntroH }
          \new Staff \IntroG
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
          \new Voice  \transpose c a, \theNotes 
      >> >>
} } }